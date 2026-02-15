import 'package:khatoon_container/src/features/purchase/data/datasources/purchase_remote_data_source.dart';
import 'package:khatoon_container/src/features/purchase/data/models/payment/payment_model.dart';

class GetPaymentsByInvoiceIdUseCase {
  final PurchaseRemoteDataSource repository;

  const GetPaymentsByInvoiceIdUseCase({required this.repository});

  Future<List<PaymentModel>> execute(int invoiceId) async {
    return await repository.getPaymentsByPurchaseId(invoiceId);
  }
}

class DeletePaymentsByIdUseCase {
  final PurchaseRemoteDataSource repository;

  const DeletePaymentsByIdUseCase({required this.repository});

  Future<void> execute(int id) async {
    // Should this be by invoiceId or paymentId? Assuming invoiceId for 'ByPurchaseId'
  }
}

class DeletePaymentUseCase {
  final PurchaseRemoteDataSource repository;

  const DeletePaymentUseCase({required this.repository});

  Future<void> execute(int id) async {
    return await repository.deletePayment(id);
  }
}

class UpdatePaymentUseCase {
  final PurchaseRemoteDataSource repository;

  const UpdatePaymentUseCase({required this.repository});

  Future<void> execute(PaymentModel payment) async {
    return await repository.updatePayment(payment);
  }
}

class CreatePaymentUseCase {
  final PurchaseRemoteDataSource repository;

  const CreatePaymentUseCase({required this.repository});

  Future<void> execute(PaymentModel payment) async {
    return await repository.createPayment(payment);
  }
}

class CreatePaymentsUseCase {
  final PurchaseRemoteDataSource repository;

  const CreatePaymentsUseCase({required this.repository});

  Future<void> execute(List<PaymentModel> payments) async {
    return await repository.createPayments(payments);
  }
}
