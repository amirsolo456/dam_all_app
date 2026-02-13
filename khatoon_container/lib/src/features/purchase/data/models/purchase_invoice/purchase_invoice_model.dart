import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_container/src/features/purchase/data/models/payment/payment_model.dart';
import 'package:khatoon_container/src/features/purchase/data/models/purchase_item/purchase_item_model.dart';
import 'package:khatoon_shared/index.dart';

part 'purchase_invoice_model.g.dart';

@JsonSerializable()
class PurchaseInvoiceModel extends Invoice {
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool isSelected = false;

  final List<PurchaseItemModel> itemsModel;
  final List<PaymentModel> paymentsModel;

  PurchaseInvoiceModel({
    required super.id,
    required super.createdAt,
    required super.status,
    required super.totalAmount,
    required this.itemsModel,
    required this.paymentsModel,
    required super.invoiceNo,
    required super.type,
    super.partyId,
    required super.isDeleted,
    required super.updatedAt,
    required super.version,
    required super.date,
  });

  factory PurchaseInvoiceModel.fromJson(Map<String, dynamic> json) {
    List<PaymentModel> payments = <PaymentModel>[];
    if (json['Payments'] != null && json['Payments'] is List) {
      payments = (json['Payments'] as List<dynamic>)
          .map((dynamic paymentJson) => PaymentModel.fromJson(paymentJson as Map<String, dynamic>))
          .toList();
    }

    List<PurchaseItemModel> items = <PurchaseItemModel>[];
    if (json['Items'] != null && json['Items'] is List) {
      items = (json['Items'] as List<dynamic>)
          .map((dynamic itemJson) => PurchaseItemModel.fromJson(itemJson as Map<String, dynamic>))
          .toList();
    }

    return PurchaseInvoiceModel(
      id: json['id'] as int? ?? 0,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'] as String) : DateTime.now(),
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'] as String) : DateTime.now(),
      date: json['date'] != null ? DateTime.parse(json['date'] as String) : DateTime.now(),
      status: (json['status'] ?? "Open").toString(),
      totalAmount: (json['totalAmount'] as num?)?.toDouble() ?? 0.0,
      itemsModel: items,
      paymentsModel: payments,
      invoiceNo: (json['invoiceNo'] as String? ?? ""),
      type: (json['type'] as String? ?? "Purchase"),
      partyId: (json['partyId'] as int?),
      isDeleted: (json['isDeleted'] as bool? ?? false),
      version: (json['version'] as int? ?? 0),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = super.toJson();
    map['Items'] = itemsModel.map((PurchaseItemModel i) => i.toJson()).toList();
    map['Payments'] = paymentsModel.map((PaymentModel p) => p.toJson()).toList();
    return map;
  }
}
