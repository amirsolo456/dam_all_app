import 'package:khatoon_shared/index.dart';

abstract class IPurchaseRepository {
  Future<List<Invoice>> getInvoices();
  Future<Invoice> getInvoiceById(int id);
  Future<Invoice> createInvoice(Invoice invoice);
  Future<Invoice> updateInvoice(Invoice invoice);
  Future<void> deleteInvoice(int id);
}
