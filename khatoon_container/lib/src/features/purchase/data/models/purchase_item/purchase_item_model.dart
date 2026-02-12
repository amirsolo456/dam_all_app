import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_shared/index.dart';

part 'purchase_item_model.g.dart';

@JsonSerializable()
class PurchaseItemModel extends InvoiceLine {
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool isSelected = false;

  PurchaseItemModel({
    required super.id,
    // required super.name,
    // required super.quantity,
    // required super.price,
    required super.invoiceId,
    required super.productId,
    required super.qty,
    required super.unitPrice,
    required super.lineTotal,
  });

  factory PurchaseItemModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseItemModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PurchaseItemModelToJson(this);
}
