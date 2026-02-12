// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Invoice _$InvoiceFromJson(Map json) => Invoice(
  id: (json['id'] as num).toInt(),
  invoiceNo: json['invoiceNo'] as String,
  type: json['type'] as String? ?? 'Sale',
  partyId: (json['partyId'] as num?)?.toInt(),
  sellerEmployeeId: (json['sellerEmployeeId'] as num?)?.toInt(),
  date: DateTime.parse(json['date'] as String),
  totalAmount: (json['totalAmount'] as num).toDouble(),
  status: json['status'] as String,
  notes: json['notes'] as String?,
  version: (json['version'] as num).toInt(),
  isDeleted: json['isDeleted'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$InvoiceToJson(Invoice instance) => <String, dynamic>{
  'id': instance.id,
  'invoiceNo': instance.invoiceNo,
  'type': instance.type,
  'partyId': instance.partyId,
  'sellerEmployeeId': instance.sellerEmployeeId,
  'date': instance.date.toIso8601String(),
  'totalAmount': instance.totalAmount,
  'status': instance.status,
  'notes': instance.notes,
  'version': instance.version,
  'isDeleted': instance.isDeleted,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};
