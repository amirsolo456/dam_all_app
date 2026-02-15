// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map json) => Payment(
  id: (json['id'] as num).toInt(),
  date: DateTime.parse(json['date'] as String),
  amount: (json['amount'] as num).toDouble(),
  direction: json['direction'] as String,
  paymentMethod: json['paymentMethod'] as String?,
  fromPartyId: (json['fromPartyId'] as num?)?.toInt(),
  toPartyId: (json['toPartyId'] as num?)?.toInt(),
  reference: json['reference'] as String?,
  notes: json['notes'] as String?,
  version: (json['version'] as num).toInt(),
  isDeleted: json['isDeleted'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
  'id': instance.id,
  'date': instance.date.toIso8601String(),
  'amount': instance.amount,
  'direction': instance.direction,
  'paymentMethod': instance.paymentMethod,
  'fromPartyId': instance.fromPartyId,
  'toPartyId': instance.toPartyId,
  'reference': instance.reference,
  'notes': instance.notes,
  'version': instance.version,
  'isDeleted': instance.isDeleted,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};
