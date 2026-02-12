// lib/data/sync/sync_manager.dart
import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:drift/drift.dart';

import 'package:khatoon_container/src/core/storage/data/db/db.dart';
import 'package:khatoon_container/src/core/storage/data/sync/sync_queue_dao.dart';
import 'package:khatoon_container/src/core/storage/data/tables/tables.dart';

@DriftAccessor(tables: <Type>[SyncQueue])
class SyncManager extends DatabaseAccessor<AppDatabase> {
  final AppDatabase db;
  final SyncQueueDao queueDao;
  final Dio dio;
  final Duration interval;
  Timer? _timer;
  bool _running = false;

  /// ترتیب ارسال - در صورت نیاز این فهرست را تغییر بده
  static const List<String> syncOrder = <String>[
    'party',
    'employee',
    'product',
    'invoice',
    'invoice_line',
    'payment',
    'payment_allocation',
    'commission',
    'salary_payment',
    'expense',
  ];
  final int maxAttempts;

  SyncManager(
    super.attachedDatabase, {
    required this.db,
    required this.queueDao,
    required this.dio,
    this.interval = const Duration(seconds: 30),
    this.maxAttempts = 5,
  });

  void start() {
    _timer ??= Timer.periodic(interval, (_) => runOnce());
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  /// اجرا یک‌باره (می‌تونی آن را بعد از enqueue صدا بزنی)
  Future<void> runOnce() async {
    if (_running) return;
    _running = true;
    try {
      final List<SyncQueueData> pending = await queueDao.fetchPending(
        limit: 1000,
      );
      if (pending.isEmpty) return;

      final Map<String, List<SyncQueueData>> groups =
          <String, List<SyncQueueData>>{};
      for (final SyncQueueData row in pending) {
        groups.putIfAbsent(row.entityType, () => <SyncQueueData>[]).add(row);
      }

      for (final String et in syncOrder) {
        final List<SyncQueueData>? items = groups[et];
        if (items == null || items.isEmpty) continue;

        final List<String> ids = items.map((SyncQueueData e) => e.id).toList();

        // mark syncing
        await queueDao.markSyncing(ids);

        // آماده‌سازی ops (payloadها را decode می‌کنیم)
        final List<dynamic> ops = items.map((SyncQueueData e) {
          try {
            return jsonDecode(e.payload);
          } catch (_) {
            return e.payload;
          }
        }).toList();

        final Map<String, Object> body = <String, Object>{
          'entityType': et,
          'ops': ops,
        };

        try {
          final Response<dynamic> res = await dio.post(
            '/sync/push',
            data: body,
          );

          if (res.statusCode != null &&
              res.statusCode! >= 200 &&
              res.statusCode! < 300) {
            final Map<String, dynamic> resp = (res.data is Map)
                ? Map<String, dynamic>.from(res.data)
                : jsonDecode(res.data.toString());

            // ok: list of syncQueue ids that server accepted
            final List<String> ok = <String>[];
            if (resp['ok'] != null && resp['ok'] is List) {
              for (final o in resp['ok']) {
                ok.add(o.toString());
              }
            }

            if (ok.isNotEmpty) {
              await queueDao.markCompleted(ok);
              // optional: cleanup
              await queueDao.removeSynced(ok);
            }

            // failed: list of { id, reason }
            final List<String> failed = <String>[];
            if (resp['failed'] != null && resp['failed'] is List) {
              for (final f in resp['failed']) {
                if (f is Map && f['id'] != null) failed.add(f['id'].toString());
              }
            }
            if (failed.isNotEmpty) await queueDao.markFailed(failed);

            // apply: changes from server (pull)
            if (resp['apply'] != null && resp['apply'] is List) {
              await _applyServerChanges(resp['apply'] as List<dynamic>);
            }
          } else {
            // server returned non-2xx
            await queueDao.markFailed(ids);
          }
        } on DioException catch (e) {
          // network / timeout / etc.
          await queueDao.markFailed(ids);

          // مثال: اگر 401 باشه می‌تونی refresh token logic اجرا کنی
          if (e.response?.statusCode == 401) {
            // let interceptors handle refresh
          }
        } catch (e) {
          await queueDao.markFailed(ids);
        }

        // بعد از هر گروه، برای جلوگیری از فشار زیاد روی سرور کمی delay بذار
        await Future.delayed(const Duration(milliseconds: 200));
      }

      // retry failed with backoff up to maxAttempts
      await _retryFailed();
    } finally {
      _running = false;
    }
  }

  Future<void> _retryFailed() async {
    final List<SyncQueueData> failedRows =
        await (select(db.syncQueue)..where(
              ($SyncQueueTable t) =>
                  t.status.equals('failed') & t.version.isSmallerThanValue(maxAttempts),
            ))
            .get();

    for (final SyncQueueData row in failedRows) {
      final int attempts = row.version;
      final int backoffMs = (1000 * (1 << attempts)).clamp(1000, 60000);
      // simple sleep for demo (in production use scheduled job)
      await Future<void>.delayed(Duration(milliseconds: backoffMs));

      await (update(db.syncQueue)
            ..where(($SyncQueueTable t) => t.id.equals(row.id)))
          .write(const SyncQueueCompanion(status: .new('pending')));
    }
  }

  Future<void> _applyServerChanges(List<dynamic> changes) async {
    await db.transaction(() async {
      for (final c in changes) {
        if (c is! Map) continue;
        final String entityType = (c['entityType'] ?? '').toString();
        final Map<String, dynamic> payload = Map<String, dynamic>.from(
          c['payload'] ?? <dynamic, dynamic>{},
        );

        switch (entityType) {
          case 'invoice':
            await _applyInvoice(payload);
            break;
          case 'payment':
            // implement _applyPayment(payload);
            break;
          // add other entities
          default:
            break;
        }
      }
    });
  }

  // نمونهٔ upsert برای invoice — مطابق اسکیمای تیبل تو
  Future<void> _applyInvoice(Map<String, dynamic> payload) async {
    final String? id = payload['id']?.toString();
    if (id == null) return;

    final Invoice? existing = await (select(
      db.invoices,
    )..where(($InvoicesTable t) => t.id.equals(id))).getSingleOrNull();
    final int serverVersion = (payload['version'] is int)
        ? payload['version'] as int
        : int.tryParse('${payload['version']}') ?? 0;

    if (existing == null) {
      // insert server-side copy
      await db
          .into(db.invoices)
          .insert(
            InvoicesCompanion.insert(
              id: id,
              invoiceNo: (payload['invoiceNo']?.toString() ?? ''),
              type: (payload['type']?.toString() ?? 'sale'),
              partyId: .new(payload['partyId']?.toString()),
              date: .new(
                payload['date'] != null
                    ? DateTime.parse(payload['date'].toString())
                    : DateTime.now(),
              ),
              totalAmount: .new(
                (payload['totalAmount'] as num?)?.toDouble() ?? 0.0,
              ),
              status: .new(payload['status']?.toString() ?? 'open'),
              version: .new(serverVersion),
              isDeleted: .new(payload['isDeleted'] == true),
              createdAt: .new(
                payload['createdAt'] != null
                    ? DateTime.parse(payload['createdAt'].toString())
                    : DateTime.now(),
              ),
              updatedAt: .new(
                payload['updatedAt'] != null
                    ? DateTime.parse(payload['updatedAt'].toString())
                    : DateTime.now(),
              ),
            ),
          );
    } else {
      if (serverVersion >= existing.version) {
        await (update(
          db.invoices,
        )..where(($InvoicesTable t) => t.id.equals(id))).write(
          InvoicesCompanion(
            invoiceNo: .new(
              payload['invoiceNo']?.toString() ?? existing.invoiceNo,
            ),
            type: .new(payload['type']?.toString() ?? existing.type),
            partyId: .new(payload['partyId']?.toString()),
            date: .new(
              payload['date'] != null
                  ? DateTime.parse(payload['date'].toString())
                  : existing.date,
            ),
            totalAmount: .new(
              (payload['totalAmount'] as num?)?.toDouble() ??
                  existing.totalAmount,
            ),
            status: .new(payload['status']?.toString() ?? existing.status),
            version: .new(serverVersion),
            isDeleted: .new(payload['isDeleted'] == true),
            updatedAt: .new(
              payload['updatedAt'] != null
                  ? DateTime.parse(payload['updatedAt'].toString())
                  : existing.updatedAt,
            ),
          ),
        );
      } else {
        // local version higher -> re-enqueue local record to push to server
        final Map<String, dynamic> localMap = <String, dynamic>{
          'id': existing.id,
          'invoiceNo': existing.invoiceNo,
          'type': existing.type,
          'partyId': existing.partyId,
          'date': existing.date.toIso8601String(),
          'totalAmount': existing.totalAmount,
          'status': existing.status,
          'version': existing.version,
          'updatedAt': existing.updatedAt.toIso8601String(),
          'isDeleted': existing.isDeleted,
        };

        await queueDao.enqueue(
          entityType: 'invoice',
          entityId: existing.id,
          operation: 'update',
          payload: localMap.toString(),
        );
      }
    }
  }
}
