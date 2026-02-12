// import 'package:drift/drift.dart';
import 'package:drift/drift.dart';
import 'package:khatoon_container/src/core/storage/data/db/db.dart';

import 'package:khatoon_container/src/core/storage/data/tables/tables.dart';

@DriftAccessor(tables: <Type>[Invoices])
class InvoiceDao extends DatabaseAccessor<AppDatabase> {
  InvoiceDao(super.db);

  Future<List<Invoice>> getAll() async {
    return await select(db.invoices).get();
  }

  Future<Stream<List<Invoice>>> watchAll() async {
    return select(db.invoices).watch();
  }

  Future<Invoice?> getById(String id) async {
    return await (select(
      db.invoices,
    )..where(($InvoicesTable t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<void> upsert(Invoice invoice) async {
    await into(db.invoices).insertOnConflictUpdate(invoice);
  }

  Future<int> markDeleted(String id) async {
    return await (update(
      db.invoices,
    )..where(($InvoicesTable t) => t.id.equals(id))).write(
      InvoicesCompanion(
        isDeleted: const .new(true),
        updatedAt: .new(DateTime.now()),
      ),
    );
  }
}
