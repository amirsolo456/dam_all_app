// lib/src/core/storage/data/repositories/invoice_repository.dart

import 'dart:async';

//
// import 'package:drift/drift.dart';
import 'package:khatoon_container/index.dart';
import 'package:khatoon_container/src/core/storage/services/usecases/invoice_dao_usecase.dart';

class InvoiceRepository {
  final InvoiceDao dao;

  final SyncQueueDao queueDao;

  InvoiceRepository({required this.queueDao, required this.dao});

  Future<List<Invoice>> getAll() {
    return dao.getAll();
  }

  Future<void> save(Invoice invoice) async {
    await dao.upsert(invoice);

    await queueDao.enqueue(
      entityType: 'invoice',
      entityId: invoice.id,
      operation: 'upsert',
      payload: invoice.toJson().toString(),
    );
  }

  Future<void> delete(String id) async {
    await dao.markDeleted(id);

    await queueDao.enqueue(
      entityType: 'invoice',
      entityId: id,
      operation: 'delete',
      payload: <String, String>{'id': id}.toString(),
    );
  }

  // Future<void> createInvoice(Insertable<Invoices> invoiceCompanion) async {
  //   final String id = invoiceCompanion.toColumns(false)['id'] as String? ?? _uuid.v4();
  //
  //   await db.transaction(() async {
  //     await into(db.invoices).insert(invoiceCompanion);
  //
  //     // enqueue snapshot
  //     final row = await (select(
  //       db.invoices,
  //     )..where((t) => t.id.equals(id))).getSingle();
  //     final payload = <String, dynamic>{
  //       'id': row.id,
  //       'invoiceNo': row.invoiceNo,
  //       'type': row.type,
  //       'partyId': row.partyId,
  //       'date': row.date.toIso8601String(),
  //       'totalAmount': row.totalAmount,
  //       'status': row.status,
  //       'version': row.version,
  //       'updatedAt': row.updatedAt.toIso8601String(),
  //       'isDeleted': row.isDeleted,
  //     };
  //
  //     await queueDao.enqueue(
  //       entityType: 'invoice',
  //       entityId: id,
  //       operation: 'insert',
  //       payload: payload.toString(),
  //     );
  //   });
  //
  //   // trigger on-demand sync
  //   unawaited(syncManager.runOnce());
  // }
  //
  // Future<void> updateInvoice(Insertable<Invoices > invoiceCompanion) async {
  //   final Map<String, Expression<Object>> map = invoiceCompanion.toColumns(false);
  //   final String id = map['id'] as String;
  //
  //   await db.transaction(() async {
  //     // increase version
  //     final existing = await (select(
  //       db.invoices,
  //     )..where((t) => t.id.equals(id))).getSingleOrNull();
  //     final newVersion = (existing?.version ?? 0) + 1;
  //
  //     await (update(db.invoices)..where((t) => t.id.equals(id))).write(
  //       InvoicesCompanion(
  //         invoiceNo: (invoiceCompanion as InvoicesCompanion).invoiceNo,
  //         type: invoiceCompanion.type,
  //         partyId: invoiceCompanion.partyId,
  //         totalAmount: invoiceCompanion.totalAmount,
  //         status: invoiceCompanion.status,
  //         version: Value(newVersion),
  //         updatedAt: Value(DateTime.now()),
  //       ),
  //     );
  //
  //     final row = await (select(
  //       db.invoices,
  //     )..where((t) => t.id.equals(id))).getSingle();
  //     final payload = <String, >{
  //       'id': row.id,
  //       'invoiceNo': row.invoiceNo,
  //       'type': row.type,
  //       'partyId': row.partyId,
  //       'date': row.date.toIso8601String(),
  //       'totalAmount': row.totalAmount,
  //       'status': row.status,
  //       'version': row.version,
  //       'updatedAt': row.updatedAt.toIso8601String(),
  //       'isDeleted': row.isDeleted,
  //     };
  //
  //     await queueDao.enqueue(
  //       entityType: 'invoice',
  //       entityId: id,
  //       operation: 'update',
  //       payload: payload,
  //     );
  //   });
  //
  //   unawaited(syncManager.runOnce());
  // }
  //
  // Future<void> softDeleteInvoice(String id) async {
  //   await db.transaction(() async {
  //     await (update(db.invoices)..where((t) => t.id.equals(id))).write(
  //       InvoicesCompanion(
  //         isDeleted: const Value(true),
  //         updatedAt: Value(DateTime.now()),
  //       ),
  //     );
  //
  //     await queueDao.enqueue(
  //       entityType: 'invoice',
  //       entityId: id,
  //       operation: 'delete',
  //       payload: <String, String>{'id': id},
  //     );
  //   });
  //
  //   unawaited(syncManager.runOnce());
  // }
}
