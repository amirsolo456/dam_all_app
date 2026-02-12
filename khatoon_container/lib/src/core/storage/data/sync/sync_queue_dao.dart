// lib/data/sync/sync_queue_dao.dart
import 'package:khatoon_container/src/core/storage/data/db/db.dart';
import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

class SyncQueueDao {
  final AppDatabase db;
  final Uuid _uuid = const Uuid();

  SyncQueueDao(this.db);

  Future<void> enqueue({
    required String entityType,
    required String entityId,
    required String operation,
    required String payload, // JSON string
  }) async {
    await db
        .into(db.syncQueue)
        .insert(
          SyncQueueCompanion.insert(
            id: _uuid.v4(),
            entityType: entityType,
            entityId: entityId,
            operation: operation,
            payload: payload,
            status: const .new('pending'),
            seq: 0,
            attempt: 0,
          ),
        );
  }

  Future<List<SyncQueueData>> fetchPending({int limit = 200}) async {
    return (db.select(db.syncQueue)
          ..where(($SyncQueueTable t) => t.status.equals('pending'))
          ..orderBy(<OrderClauseGenerator<$SyncQueueTable>>[
            ($SyncQueueTable t) =>
                OrderingTerm(expression: t.createdAt),
          ])
          ..limit(limit))
        .get();
  }

  Future<void> setStatusForIds(List<String> ids, String status) async {
    if (ids.isEmpty) return;
    await (db.update(db.syncQueue)
          ..where(($SyncQueueTable t) => t.id.isIn(ids)))
        .write(SyncQueueCompanion(status: .new(status)));
  }

  Future<void> markCompleted(List<String> ids) async {
    await setStatusForIds(ids, 'synced');
  }

  Future<void> markFailed(List<String> ids) async {
    await setStatusForIds(ids, 'failed');
  }

  Future<void> markSyncing(List<String> ids) async {
    await setStatusForIds(ids, 'syncing');
  }

  /// اختیاری: پاک کردن آیتمهای synced از جدول (اگر نخواستیش نگه دار)
  Future<void> removeSynced(List<String> ids) async {
    if (ids.isEmpty) return;
    await (db.delete(
      db.syncQueue,
    )..where(($SyncQueueTable t) => t.id.isIn(ids))).go();
  }
}
