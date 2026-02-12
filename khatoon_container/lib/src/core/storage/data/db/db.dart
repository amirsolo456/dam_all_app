// lib/src/db/database.dart
import 'dart:io';
import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:drift_sqflite/drift_sqflite.dart';
import 'package:khatoon_container/src/core/storage/data/tables/tables.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final Directory dbFolder = await getApplicationDocumentsDirectory();
    final File file = File(p.join(dbFolder.path, 'farm.db'));
    return SqfliteQueryExecutor(path: file.path, logStatements: false);
  });
}

// DatabaseConnection openConnection(File file) {
//   final NativeDatabase executor = NativeDatabase(file, logStatements: false);
// // ensure foreign keys are enabled
//   executor.beginTransaction().runCustom('PRAGMA foreign_keys = ON;');
//   return DatabaseConnection.delayed(executor);
// }

// MigrationStrategy: نمونه اولیه — تو باید migrationهای واقعی تولیدشده‌ات را اضافه کنی
MigrationStrategy migrationStrategy = MigrationStrategy(
  onCreate: (Migrator m) async {
    // drift خودش جداول را ایجاد می‌کند اگر همه چی درست باشه
    await m.createAll();
  },
  onUpgrade: (Migrator m, int from, int to) async {
    // در اینجا ALTER TABLE برای ستون‌های جدید را مدیریت کن
    // برای مثال: if (from < 2) await m.addColumn(table, column);
  },
);

@DriftDatabase(
  tables: <Type>[
    Parties,
    Employees,
    Products,
    Invoices,
    InvoiceLines,
    Payments,
    PaymentAllocations,
    Expenses,
    SalaryPayments,
    CommissionRecords,
    SyncQueue,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // --- نمونهٔ امن‌تر: دریافت Companions و یک payload Map برای sync ---
  Future<void> insertInvoiceWithLines(
    String invoiceId,
    InvoicesCompanion invoiceCompanion,
    List<InvoiceLinesCompanion> linesCompanions,
    Map<String, dynamic> payload, // payload آماده برای jsonEncode
    String deviceId,
  ) async {
    return transaction(() async {
      // درج فاکتور
      await into(invoices).insert(invoiceCompanion);

      // درج سطرها
      for (final InvoiceLinesCompanion l in linesCompanions) {
        await into(invoiceLines).insert(l);
      }
      final SyncQueueData? nextSeq =
          await (select(syncQueue)
                ..addColumns(<Expression<Object>>[syncQueue.seq.max()]))
              .getSingleOrNull();

      // ایجاد رکورد SyncQueue با payload از caller (Map -> json)
      final String payloadJson = jsonEncode(payload);
      await into(syncQueue).insert(
        SyncQueueCompanion.insert(
          id: invoiceId,
          entityType: 'invoice',
          entityId: invoiceId,
          operation: 'insert',
          payload: payloadJson,
          status: const .new('pending'),
          seq: (nextSeq?.seq ?? 0) + 1,
          attempt: (nextSeq?.seq ?? 0) + 1,
        ),
      );
    });
  }

  // fetch pending
  Future<List<SyncQueueData>> fetchPendingSyncs({int limit = 50}) {
    return (select(syncQueue)
          ..where(($SyncQueueTable s) => s.status.equals('pending'))
          ..limit(limit))
        .get();
  }

  Future<void> markSyncing(String id) {
    return (update(
      syncQueue,
    )..where(($SyncQueueTable t) => t.id.equals(id))).write(
      SyncQueueCompanion(
        status: const .new('syncing'),
        updatedAt: .new(DateTime.now()),
      ),
    );
  }

  Future<void> markSynced(String id) {
    return (update(
      syncQueue,
    )..where(($SyncQueueTable t) => t.id.equals(id))).write(
      SyncQueueCompanion(
        status: const .new('synced'),
        updatedAt: .new(DateTime.now()),
      ),
    );
  }

  Future<void> markFailed(String id, {String? reason}) {
    return (update(
      syncQueue,
    )..where(($SyncQueueTable t) => t.id.equals(id))).write(
      SyncQueueCompanion(
        status: const .new('failed'),
        updatedAt: .new(DateTime.now()),
      ),
    );
  }

  // helper queries
  Future<Invoice?> getInvoiceById(String id) => (select(
    invoices,
  )..where(($InvoicesTable i) => i.id.equals(id))).getSingleOrNull();

  Future<void> upsertRemoteInvoice(Map<String, dynamic> remoteInvoice) async {
    final String id = remoteInvoice['id'] as String;
    final Invoice? existing = await getInvoiceById(id);

    if (existing == null) {
      // اگر remote data فرمت مناسبی داره می‌تونی مستقیم وارد کنی
      // اما باید mapping داشته باشی؛ مثال پایین فرض می‌کنه فیلدها هم‌نام هستند:
      final InvoicesCompanion companion = InvoicesCompanion.insert(
        id: remoteInvoice['id'] as String,
        invoiceNo: remoteInvoice['invoiceNo'] as String,
        type: remoteInvoice['type'] as String,
        partyId: .new(remoteInvoice['partyId'] as String?),
        sellerEmployeeId: .new(remoteInvoice['sellerEmployeeId'] as String?),
        date: .new(DateTime.parse(remoteInvoice['date'] as String)),
        totalAmount: .new((remoteInvoice['totalAmount'] as num).toDouble()),
        status: .new(remoteInvoice['status'] as String? ?? 'open'),
        notes: .new(remoteInvoice['notes'] as String?),
        createdAt: .new(DateTime.parse(remoteInvoice['createdAt'] as String)),
        updatedAt: .new(DateTime.parse(remoteInvoice['updatedAt'] as String)),
      );
      await into(invoices).insert(companion);
    } else {
      await (update(
        invoices,
      )..where(($InvoicesTable t) => t.id.equals(id))).write(
        InvoicesCompanion(
          invoiceNo: .new(remoteInvoice['invoiceNo'] as String),
          totalAmount: .new((remoteInvoice['totalAmount'] as num).toDouble()),
          status: .new(remoteInvoice['status'] as String? ?? existing.status),
          updatedAt: .new(DateTime.parse(remoteInvoice['updatedAt'] as String)),
          // سایر فیلدها را اضافه کن در صورت نیاز
        ),
      );
    }
  }
}
