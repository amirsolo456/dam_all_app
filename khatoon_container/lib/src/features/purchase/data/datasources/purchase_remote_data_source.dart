import 'package:dio/dio.dart';
import 'package:khatoon_container/src/core/storage/services/errors/exceptions.dart';
import 'package:khatoon_container/src/features/purchase/data/models/purchase_invoice/purchase_invoice_model.dart';
import 'package:khatoon_container/src/features/purchase/data/models/payment/payment_model.dart';
import 'package:khatoon_container/src/features/purchase/data/models/purchase_item/purchase_item_model.dart';
import 'package:khatoon_shared/index.dart';

abstract class IPurchaseRemoteDataSource {
  Future<List<PurchaseInvoiceModel>> getPurchases();
  Future<PurchaseInvoiceModel> getInvoiceById(int id);
  Future<PurchaseInvoiceModel> createPurchase(PurchaseInvoiceModel invoice);
  Future<PurchaseInvoiceModel> updatePurchase(PurchaseInvoiceModel invoice);
  Future<void> deleteInvoice(int id);

  Future<List<PurchaseItemModel>> getPurchaseItemsByPurchaseId(int purchaseId);
  Future<void> createPurchaseItem(PurchaseInvoiceModel purchase, PurchaseItemModel item);
  Future<void> updatePurchaseItem(PurchaseItemModel item);
  Future<void> deletePurchaseItem(PurchaseItemModel item);
  Future<void> deletePurchaseItemsById(int purchaseId);

  Future<List<PaymentModel>> getPaymentsByPurchaseId(int purchaseId);
  Future<void> createPayment(PurchaseInvoiceModel purchase, PaymentModel payment);
  Future<void> createPayments(PurchaseInvoiceModel purchase, List<PaymentModel> payments);
  Future<void> updatePayment(PaymentModel payment);
  Future<void> deletePayment(PaymentModel payment);
  Future<void> deletePaymentsById(int purchaseId);
}

class PurchaseRemoteDataSource implements IPurchaseRemoteDataSource {
  final Dio dioClient;

  PurchaseRemoteDataSource({required this.dioClient});

  @override
  Future<List<PurchaseInvoiceModel>> getPurchases() async {
    try {
      final Response<dynamic> response = await dioClient.get('/Invoices');
      final List<dynamic> data = response.data;
      return data.map((dynamic json) => PurchaseInvoiceModel.fromJson(json as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Error fetching invoices');
    }
  }

  @override
  Future<PurchaseInvoiceModel> createPurchase(PurchaseInvoiceModel invoice) async {
    try {
      final Response<dynamic> response = await dioClient.post(
        '/Invoices',
        data: invoice.toJson(),
      );
      return PurchaseInvoiceModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Error creating invoice');
    }
  }

  @override
  Future<PurchaseInvoiceModel> updatePurchase(PurchaseInvoiceModel invoice) async {
    try {
      final Response<dynamic> response = await dioClient.put(
        '/Invoices/${invoice.id}',
        data: invoice.toJson(),
      );
      return PurchaseInvoiceModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Error updating invoice');
    }
  }

  @override
  Future<void> deleteInvoice(int id) async {
    try {
      await dioClient.delete('/Invoices/$id');
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Error deleting invoice');
    }
  }

  @override
  Future<PurchaseInvoiceModel> getInvoiceById(int id) async {
    try {
      final Response<dynamic> response = await dioClient.get('/Invoices/$id');
      return PurchaseInvoiceModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Error fetching invoice');
    }
  }

  @override
  Future<List<PurchaseItemModel>> getPurchaseItemsByPurchaseId(int purchaseId) async {
    try {
      final Response<dynamic> response = await dioClient.get('/InvoiceLines?invoiceId=$purchaseId');
      final List<dynamic> data = response.data;
      return data.map((dynamic json) => PurchaseItemModel.fromJson(json as Map<String, dynamic>)).toList();
    } catch (e) {
      throw ServerException(message: 'Error fetching items');
    }
  }

  @override
  Future<void> createPurchaseItem(PurchaseInvoiceModel purchase, PurchaseItemModel item) async {
    await dioClient.post('/InvoiceLines', data: item.toJson());
  }

  @override
  Future<void> updatePurchaseItem(PurchaseItemModel item) async {
    await dioClient.put('/InvoiceLines/${item.id}', data: item.toJson());
  }

  @override
  Future<void> deletePurchaseItem(PurchaseItemModel item) async {
    await dioClient.delete('/InvoiceLines/${item.id}');
  }

  @override
  Future<void> deletePurchaseItemsById(int purchaseId) async {
    // Backend should handle this or we do it line by line
  }

  @override
  Future<List<PaymentModel>> getPaymentsByPurchaseId(int purchaseId) async {
    final Response<dynamic> response = await dioClient.get('/Payments?invoiceId=$purchaseId');
    return (response.data as List).map((dynamic e) => PaymentModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<void> createPayment(PurchaseInvoiceModel purchase, PaymentModel payment) async {
    await dioClient.post('/Payments', data: payment.toJson());
  }

  @override
  Future<void> createPayments(PurchaseInvoiceModel purchase, List<PaymentModel> payments) async {
    for (final PaymentModel p in payments) {
      await createPayment(purchase, p);
    }
  }

  @override
  Future<void> updatePayment(PaymentModel payment) async {
    await dioClient.put('/Payments/${payment.id}', data: payment.toJson());
  }

  @override
  Future<void> deletePayment(PaymentModel payment) async {
    await dioClient.delete('/Payments/${payment.id}');
  }

  @override
  Future<void> deletePaymentsById(int purchaseId) async {
  }
}
