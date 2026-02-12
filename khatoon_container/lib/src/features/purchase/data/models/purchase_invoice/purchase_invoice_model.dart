import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_container/src/features/purchase/data/models/payment/payment_model.dart';
import 'package:khatoon_container/src/features/purchase/data/models/purchase_item/purchase_item_model.dart';
import 'package:khatoon_shared/index.dart';

part 'purchase_invoice_model.g.dart';

@JsonSerializable()
class PurchaseInvoiceModel extends Invoice {
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool isSelected = false;

  // final List<DeliveryModel> deliveriesModel;

  final List<PurchaseItemModel> itemsModel;

  final List<PaymentModel> paymentsModel;

  // @override
  // final String sellerId;
  // @override
  // final String sellerName;
  // @override
  // final String notes;
  // @override
  // final double totalAmount;
  // @override
  // final double paidAmount;

  PurchaseInvoiceModel({
    required super.id,
    required super.createdAt,
    required super.status,
    // required super.paymentStatus,
    // required super.deliveryStatus,
    // required super.isSettled,
    // required super.sellerId,
    // required super.sellerName,
    // required super.notes,
    required super.totalAmount,
    // required super.paidAmount,
    // required this.deliveriesModel,
    required this.itemsModel,
    required this.paymentsModel,
    required super.invoiceNo,
    required super.type,
    required super.partyId,

    required super.isDeleted,
    required super.updatedAt,
  }) : super(version: 0,date: createdAt);

  // : super(
  //    deliveries: deliveriesModel,
  //    items: itemsModel,
  //    payments: paymentsModel,
  //  );

  // تبدیل از JSON به مدل
  factory PurchaseInvoiceModel.fromJson(Map<String, dynamic> json) {
    switch (json['paymentStatus']) {
      case 'unpaid':
        break;
      case 'partial':
        break;
      case 'paid':
        break;
      default:
    }

    // تبدیل deliveryStatus از String به enum
    // DeliveryStatus deliveryStatus;
    // switch (json['deliveryStatus']) {
    //   case 'pending':
    //     deliveryStatus = DeliveryStatus.pending;
    //     break;
    //   case 'shipped':
    //     deliveryStatus = DeliveryStatus.shipped;
    //     break;
    //   case 'delivered':
    //     deliveryStatus = DeliveryStatus.delivered;
    //     break;
    //   default:
    //     deliveryStatus = DeliveryStatus.pending;
    // }

    // تبدیل payments از لیست JSON
    List<PaymentModel>? payments = <PaymentModel>[];
    if (json['Payments'] != null && json['Payments'] is List) {
      payments = (json['Payments'] as List<dynamic>)
          .map((dynamic paymentJson) => PaymentModel.fromJson(paymentJson))
          .toList();
    }

    // تبدیل deliveries از لیست JSON
    // List<DeliveryModel>? deliveries = <DeliveryModel>[];
    // if (json['Deliveries'] != null && json['Deliveries'] is List) {
    //   deliveries = (json['Deliveries'] as List<dynamic>)
    //       .map((dynamic deliveryJson) => DeliveryModel.fromJson(deliveryJson))
    //       .toList();
    // }

    // تبدیل items از لیست JSON
    List<PurchaseItemModel>? items = <PurchaseItemModel>[];
    if (json['Items'] != null && json['Items'] is List<PurchaseItemModel>) {
      items = (json['Items'] as List<dynamic>)
          .map((dynamic itemJson) => PurchaseItemModel.fromJson(itemJson))
          .toList();
    }

    return PurchaseInvoiceModel(
      id: json['id'] as int,
      // sellerId: json['sellerId'] as String,
      // sellerName: json['SellerName'] ?? '',
      // notes: json['notes'] ?? '',
      createdAt: (json['createdAt'] as DateTime),
      status: (json['Status'] ?? 0) as String,
      totalAmount: (json['totalAmount'] as num).toDouble(),

      // paidAmount: (json['paidAmount'] as num).toDouble(),
      // paymentStatus: paymentStatus,
      // deliveryStatus: deliveryStatus,
      // isSettled: (json['isSettled'] ?? false) as bool,
      // deliveriesModel: deliveries,
      itemsModel: items,
      paymentsModel: payments,
      invoiceNo: (json['invoiceNo'] as String),
      type: (json['type'] as String),
      partyId: (json['partyId'] as int),
      isDeleted: (json['isDeleted'] as bool),
      updatedAt: (json['updatedAt'] as DateTime),
    );
  }

  // تبدیل از مدل به JSON
  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      // 'sellerId': sellerId,
      // 'SellerName': sellerName,
      // 'notes': notes,
      'date': createdAt,
      'Status': status,
      'totalAmount': totalAmount,
      // 'paidAmount': paidAmount,
      // 'paymentStatus': paymentStatus.toString().split('.').last,
      // 'deliveryStatus': deliveryStatus.toString().split('.').last,
      // 'isSettled': isSettled,
      // 'Deliveries': deliveriesModel.map((DeliveryModel d) => d).toList(),
      'Items': itemsModel.map((PurchaseItemModel i) => i).toList(),
      'Payments': paymentsModel.map((PaymentModel p) => p.toJson()).toList(),
    };
  }
}
