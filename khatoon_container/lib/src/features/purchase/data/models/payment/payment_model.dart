import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_container/src/features/purchase/data/models/purchase_item/purchase_item_model.dart';
import 'package:khatoon_shared/index.dart';

part 'payment_model.g.dart';

@JsonSerializable()
class PaymentModel extends Payment {
  @JsonKey(name: 'ItemsModel', defaultValue: <PurchaseItemModel>[])
  final List<PurchaseItemModel> purchaseItemModels;

  @JsonKey(name: 'PaymentsModel', defaultValue: <PaymentModel>[])
  final List<PaymentModel> paymentModels;

  PaymentModel({
    required this.purchaseItemModels,
    required this.paymentModels,
    required super.id,
    required super.date,
    required super.amount,
    required super.direction,
    super.paymentMethod,
    super.fromPartyId,
    super.toPartyId,
    super.reference,
    super.notes,
    required super.version,
    required super.isDeleted,
    required super.createdAt,
    required super.updatedAt,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PaymentModelToJson(this);

  List<PurchaseItemModel> get items => purchaseItemModels;

  List<PaymentModel> get innerPayments => paymentModels;
}
