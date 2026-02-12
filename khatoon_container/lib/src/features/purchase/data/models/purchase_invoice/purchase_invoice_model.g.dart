// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_invoice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseInvoiceModel _$PurchaseInvoiceModelFromJson(Map json) =>
    PurchaseInvoiceModel(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      status: json['status'] as String,
      totalAmount: (json['totalAmount'] as num).toDouble(),
      itemsModel: (json['itemsModel'] as List<dynamic>)
          .map(
            (e) =>
                PurchaseItemModel.fromJson(Map<String, dynamic>.from(e as Map)),
          )
          .toList(),
      paymentsModel: (json['paymentsModel'] as List<dynamic>)
          .map(
            (e) => PaymentModel.fromJson(Map<String, dynamic>.from(e as Map)),
          )
          .toList(),
      invoiceNo: json['invoiceNo'] as String?,
      type: json['type'] as String?,
      partyId: json['partyId'] as String?,
      isDeleted: json['isDeleted'] as bool,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$PurchaseInvoiceModelToJson(
  PurchaseInvoiceModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'invoiceNo': instance.invoiceNo,
  'type': instance.type,
  'partyId': instance.partyId,
  'totalAmount': instance.totalAmount,
  'status': instance.status,
  'isDeleted': instance.isDeleted,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'itemsModel': instance.itemsModel.map((e) => e.toJson()).toList(),
  'paymentsModel': instance.paymentsModel.map((e) => e.toJson()).toList(),
};
