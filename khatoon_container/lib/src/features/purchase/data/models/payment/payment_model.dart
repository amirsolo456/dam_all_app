import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_container/src/features/purchase/data/models/purchase_item/purchase_item_model.dart';
import 'package:khatoon_shared/index.dart';

// import 'package:khatoon_shared/models/enums.dart';
// import 'package:khatoon_shared/models/payment.dart';

part 'payment_model.g.dart';

@JsonSerializable()
class PaymentModel extends Payment {
  // final String method;

  // @JsonKey(name: 'DeliveriesModel', defaultValue: <DeliveryModel>[])
  // final List<DeliveryModel> deliveryModels;

  @JsonKey(name: 'ItemsModel', defaultValue: <PurchaseItemModel>[])
  final List<PurchaseItemModel> purchaseItemModels;

  @JsonKey(name: 'PaymentsModel', defaultValue: <PaymentModel>[])
  final List<PaymentModel> paymentModels;

  PaymentModel({
    // required this.deliveryModels,
    required this.purchaseItemModels,
    required this.paymentModels,

    // required this.id,
    // required this.date,
    required super.id,
    // required super.sellerId,
    // required super.sellerName,
    // required super.status,
    // required super.totalAmount,
    // required super.paidAmount,
    // required super.paymentStatus,
    // required super.deliveryStatus,
    // required super.isSettled,
    // required super.deliveries,
    // required super.items,
    // required super.payments,
    required super.date,
    required super.notes,
    required super.amount,
    required super.method,

    // required this.sellerId,
    // required this.sellerName,
    // required this.status,
    // required this.totalAmount,
    // required this.paidAmount,
    // required this.paymentStatus,
    // required this.deliveryStatus,
    // required this.isSettled,
    // required this.notes,
  });

  // : super(
  //        // id: id,
  //        // date: date,
  //        // sellerId: sellerId,
  //        // sellerName: sellerName,
  //        // status: status,
  //        // totalAmount: totalAmount,
  //        // paidAmount: paidAmount,
  //        // paymentStatus: paymentStatus,
  //        // deliveryStatus: deliveryStatus,
  //        // isSettled: isSettled,
  //        deliveries: deliveryModels,
  //        // ارسال به عنوان List<dynamic>
  //        items: purchaseItemModels,
  //        // ارسال به عنوان List<dynamic>
  //        payments: paymentModels,
  //
  //        // ارسال به عنوان List<dynamic>
  //      );

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PaymentModelToJson(this);

  // @override
  // List<DeliveryModel> get deliveries => deliveryModels;

  List<PurchaseItemModel> get items => purchaseItemModels;

  List<PaymentModel> get innerPayments => paymentModels;
}
