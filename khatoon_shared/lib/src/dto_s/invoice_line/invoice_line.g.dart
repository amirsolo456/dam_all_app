// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceLine _$InvoiceLineFromJson(Map json) => InvoiceLine(
  id: (json['id'] as num).toInt(),
  invoiceId: (json['invoiceId'] as num).toInt(),
  productId: (json['productId'] as num?)?.toInt(),
  description: json['description'] as String?,
  quantity: (json['quantity'] as num).toDouble(),
  unitPrice: (json['unitPrice'] as num).toDouble(),
  lineTotal: (json['lineTotal'] as num).toDouble(),
  partyId: (json['partyId'] as num?)?.toInt(),
  sellerEmployeeId: (json['sellerEmployeeId'] as num?)?.toInt(),
  version: (json['version'] as num).toInt(),
  isDeleted: json['isDeleted'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$InvoiceLineToJson(InvoiceLine instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoiceId': instance.invoiceId,
      'productId': instance.productId,
      'description': instance.description,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'lineTotal': instance.lineTotal,
      'partyId': instance.partyId,
      'sellerEmployeeId': instance.sellerEmployeeId,
      'version': instance.version,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
