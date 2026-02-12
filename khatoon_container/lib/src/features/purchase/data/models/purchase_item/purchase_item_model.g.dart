// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseItemModel _$PurchaseItemModelFromJson(Map json) => PurchaseItemModel(
  id: (json['id'] as num).toInt(),
  invoiceId: (json['invoiceId'] as num).toInt(),
  productId: (json['productId'] as num).toInt(),
  qty: (json['qty'] as num).toDouble(),
  unitPrice: (json['unitPrice'] as num).toDouble(),
  lineTotal: (json['lineTotal'] as num).toDouble(),
);

Map<String, dynamic> _$PurchaseItemModelToJson(PurchaseItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoiceId': instance.invoiceId,
      'productId': instance.productId,
      'qty': instance.qty,
      'unitPrice': instance.unitPrice,
      'lineTotal': instance.lineTotal,
    };
