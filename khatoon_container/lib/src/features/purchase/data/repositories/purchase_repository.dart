import 'package:khatoon_container/src/features/purchase/data/datasources/purchase_remote_data_source.dart';
import 'package:khatoon_container/src/features/purchase/data/models/purchase_invoice/purchase_invoice_model.dart';
import 'package:khatoon_container/src/features/purchase/domain/repositories/i_purchase_repository.dart';
import 'package:khatoon_shared/index.dart';

class PurchaseRepository implements IPurchaseRepository {
  final PurchaseRemoteDataSource remoteDataSource;

  const PurchaseRepository({
    required this.remoteDataSource,
  });

  @override
  Future<Invoice> createInvoice(Invoice invoice) {
    return remoteDataSource.createPurchase(invoice as PurchaseInvoiceModel);
  }

  @override
  Future<void> deleteInvoice(int id) {
    return remoteDataSource.deleteInvoice(id);
  }

  @override
  Future<Invoice> getInvoiceById(int id) {
    return remoteDataSource.getInvoiceById(id);
  }

  @override
  Future<List<Invoice>> getInvoices() {
    return remoteDataSource.getPurchases();
  }

  @override
  Future<Invoice> updateInvoice(Invoice invoice) {
    return remoteDataSource.updatePurchase(invoice as PurchaseInvoiceModel);
  }
}
