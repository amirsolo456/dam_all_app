import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_shared/index.dart';

part 'purchase_item_model.g.dart';

@JsonSerializable()
class PurchaseItemModel extends InvoiceLine {
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool isSelected = false;

  PurchaseItemModel({
    required super.id,
    required super.invoiceId,
    super.productId,
    super.description,
    required super.quantity,
    required super.unitPrice,
    required super.lineTotal,
    super.partyId,
    super.sellerEmployeeId,
    required super.version,
    required super.isDeleted,
    required super.createdAt,
    required super.updatedAt,
  });

  factory PurchaseItemModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseItemModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PurchaseItemModelToJson(this);
}
