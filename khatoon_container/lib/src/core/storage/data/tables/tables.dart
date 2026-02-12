// lib/src/db/tables.dart
// ignore_for_file: always_specify_types

import 'package:drift/drift.dart';

class Parties extends Table {
  TextColumn get id => text()();

  TextColumn get type =>
      text().withDefault(const Constant('customer'))(); // customer/vendor/other
  TextColumn get name => text()();

  TextColumn get phone => text().nullable()();

  IntColumn get version => integer().withDefault(const Constant(0))();

  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();

  TextColumn get address => text().nullable()();

  TextColumn get notes => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();

  @override
  Set<Column> get primaryKey => <Column<Object>>{id};
}

class Employees extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();

  TextColumn get role => text().nullable()();

  RealColumn get salaryAmount => real().nullable()(); // توافقی
  BoolColumn get isCommissioned =>
      boolean().withDefault(const Constant(false))();

  RealColumn get commissionPercent => real().nullable()();

  TextColumn get notes => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();

  IntColumn get version =>
      integer().withDefault(const Constant(0))();

  BoolColumn get isDeleted =>
      boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => <Column<Object>>{id};
}

class Products extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();

  TextColumn get unit => text().nullable()(); // kg/pcs/service
  RealColumn get defaultPrice => real().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();

  IntColumn get version =>
      integer().withDefault(const Constant(0))();

  BoolColumn get isDeleted =>
      boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => <Column<Object>>{id};
}

class Invoices extends Table {
  TextColumn get id => text()();

  TextColumn get invoiceNo => text()();

  TextColumn get type => text()(); // 'sale' | 'purchase'

  // optional foreign keys -> use nullable() and a normal REFERENCES constraint
  TextColumn get partyId =>
      text().nullable().customConstraint('REFERENCES parties(id)')();

  TextColumn get sellerEmployeeId =>
      text().nullable().customConstraint('REFERENCES employees(id)')();

  DateTimeColumn get date => dateTime().clientDefault(() => DateTime.now())();

  RealColumn get totalAmount => real().withDefault(const Constant(0.0))();

  TextColumn get status =>
      text().withDefault(const Constant('open'))(); // open/partially_paid/paid
  TextColumn get notes => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();

  IntColumn get version =>
      integer().withDefault(const Constant(0))();

  BoolColumn get isDeleted =>
      boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => <Column<Object>>{id};
}

class InvoiceLines extends Table {
  TextColumn get id => text()();

  TextColumn get invoiceId =>
      text().customConstraint('NOT NULL REFERENCES invoices(id)')();

  TextColumn get productId =>
      text().nullable().customConstraint('REFERENCES products(id)')();

  TextColumn get partyId =>
      text().nullable().customConstraint('REFERENCES parties(id)')();

  TextColumn get sellerEmployeeId =>
      text().nullable().customConstraint('REFERENCES employees(id)')();

  TextColumn get description => text().nullable()();

  RealColumn get quantity =>
      real().withDefault(const Constant(1.0))();

  RealColumn get unitPrice =>
      real().withDefault(const Constant(0.0))();

  RealColumn get lineTotal =>
      real().generatedAs(quantity * unitPrice)();

  IntColumn get version =>
      integer().withDefault(const Constant(0))();

  BoolColumn get isDeleted =>
      boolean().withDefault(const Constant(false))();

  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();

  @override
  Set<Column> get primaryKey => {id};
}


class Payments extends Table {
  TextColumn get id => text()();

  DateTimeColumn get date => dateTime().clientDefault(() => DateTime.now())();

  RealColumn get amount => real()();

  TextColumn get direction => text()(); // 'in' | 'out'
  TextColumn get paymentMethod => text().nullable()();

  TextColumn get fromPartyId => text().nullable()();

  TextColumn get toPartyId => text().nullable()();

  TextColumn get reference => text().nullable()();

  TextColumn get notes => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();

  IntColumn get version =>
      integer().withDefault(const Constant(0))();

  BoolColumn get isDeleted =>
      boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => <Column<Object>>{id};
}

class PaymentAllocations extends Table {
  TextColumn get id => text()();

  TextColumn get paymentId =>
      text().customConstraint('NOT NULL REFERENCES payments(id)')();

  TextColumn get invoiceId =>
      text().customConstraint('NOT NULL REFERENCES invoices(id)')();

  RealColumn get amountAllocated => real()();

  IntColumn get version =>
      integer().withDefault(const Constant(0))();

  BoolColumn get isDeleted =>
      boolean().withDefault(const Constant(false))();

  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

  @override
  Set<Column> get primaryKey => {id};
}


class Expenses extends Table {
  TextColumn get id => text()();

  DateTimeColumn get date => dateTime().clientDefault(() => DateTime.now())();

  TextColumn get category => text()(); // feed, meds, repair...
  RealColumn get amount => real()();

  TextColumn get notes => text().nullable()();

  TextColumn get relatedInvoiceId =>
      text().nullable().customConstraint('REFERENCES invoices(id)')();

  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();

  IntColumn get version =>
      integer().withDefault(const Constant(0))();

  BoolColumn get isDeleted =>
      boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => <Column<Object>>{id};
}

class SalaryPayments extends Table {
  TextColumn get id => text()();

  TextColumn get employeeId =>
      text().customConstraint('NOT NULL REFERENCES employees(id)')();

  DateTimeColumn get periodStart => dateTime()();

  DateTimeColumn get periodEnd => dateTime()();

  RealColumn get amountPaid => real()();

  DateTimeColumn get datePaid =>
      dateTime().clientDefault(() => DateTime.now())();

  TextColumn get notes => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

  IntColumn get version =>
      integer().withDefault(const Constant(0))();

  BoolColumn get isDeleted =>
      boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => <Column<Object>>{id};
}

class CommissionRecords extends Table {
  TextColumn get id => text()();

  TextColumn get employeeId =>
      text().customConstraint('NOT NULL REFERENCES employees(id)')();

  TextColumn get invoiceId =>
      text().customConstraint('NOT NULL REFERENCES invoices(id)')();

  RealColumn get calculatedAmount => real()();

  RealColumn get paidAmount => real().withDefault(const Constant(0.0))();

  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();

  IntColumn get version =>
      integer().withDefault(const Constant(0))();

  BoolColumn get isDeleted =>
      boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => <Column<Object>>{id};
}

class Items extends Table {
  TextColumn get id => text()(); // UUID, client-generated
  TextColumn get title => text().withLength(min: 0, max: 512)();

  TextColumn get body => text().nullable()();

  IntColumn get version =>
      integer().withDefault(const Constant(0))(); // for simple conflict resolution

  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  BoolColumn get isDeleted =>
      boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class SyncQueue extends Table {
  /// UUID – کلید اصلی
  TextColumn get id => text()();
  IntColumn get attempt =>integer()();

  /// فقط برای ترتیب sync (نه autoIncrement)
  IntColumn get seq => integer()();

  TextColumn get entityType => text()(); // invoice, payment, ...
  TextColumn get entityId => text()();   // local id
  TextColumn get operation => text()();  // insert | update | delete
  TextColumn get payload => text()();    // full json snapshot

  TextColumn get status =>
      text().withDefault(const Constant('pending'))();

  IntColumn get version =>
      integer().withDefault(const Constant(0))();

  BoolColumn get isDeleted =>
      boolean().withDefault(const Constant(false))();

  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();



  @override
  Set<Column> get primaryKey => {id};
}


class Tombstones extends Table {
  TextColumn get id => text()();

  TextColumn get entityType => text()();

  TextColumn get entityId => text()();

  DateTimeColumn get deletedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
