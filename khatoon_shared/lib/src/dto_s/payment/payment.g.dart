// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map json) => Payment(
  id: (json['id'] as num).toInt(),
  date: DateTime.parse(json['date'] as String),
  amount: (json['amount'] as num).toDouble(),
  method: json['method'] as String,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
  'id': instance.id,
  'date': instance.date.toIso8601String(),
  'amount': instance.amount,
  'method': instance.method,
  'notes': instance.notes,
};
