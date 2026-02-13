import 'package:khatoon_container/src/features/purchase/data/datasources/purchase_remote_data_source.dart';
import 'package:khatoon_container/src/features/purchase/data/models/payment/payment_model.dart';
import 'package:khatoon_container/src/features/purchase/data/models/purchase_invoice/purchase_invoice_model.dart';
import 'package:khatoon_shared/index.dart';

class GetPaymentsByInvoiceIdUseCase {
  final PurchaseRemoteDataSource repository;

  const GetPaymentsByInvoiceIdUseCase({required this.repository});

  Future<Invoice> execute(PurchaseInvoiceModel invoice) async {
    return await repository.getInvoiceById(invoice.id);
  }
}

class DeletePaymentsByIdUseCase {
  final PurchaseRemoteDataSource repository;

  const DeletePaymentsByIdUseCase({required this.repository});

  Future<void> execute(PurchaseInvoiceModel purchase) async {
    return await repository.deleteInvoice(purchase.id);
  }
}

class DeletePaymentUseCase {
  final PurchaseRemoteDataSource repository;

  const DeletePaymentUseCase({required this.repository});

  Future<void> execute(Invoice payment) async {
    return await repository.deleteInvoice(payment.id);
  }
}

class UpdatePaymentUseCase {
  final PurchaseRemoteDataSource repository;

  const UpdatePaymentUseCase({required this.repository});

  Future<void> execute(PurchaseInvoiceModel payment) async {
    await repository.updatePurchase(payment    );
  }
}

class CreatePaymentUseCase {
  final PurchaseRemoteDataSource repository;

  const CreatePaymentUseCase({required this.repository});

  Future<void> execute(PurchaseInvoiceModel purchase, Invoice payment) async {
    await repository.createPurchase(purchase);
  }
}

class CreatePaymentsUseCase {
  final PurchaseRemoteDataSource repository;

  const CreatePaymentsUseCase({required this.repository});

  Future<void> execute(PurchaseInvoiceModel purchase, Invoice payment) async {
    await repository.createPurchase(purchase);
  }
}
