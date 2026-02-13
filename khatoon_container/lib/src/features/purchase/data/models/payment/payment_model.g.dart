// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) => PaymentModel(
  purchaseItemModels:
      (json['ItemsModel'] as List<dynamic>?)
          ?.map((e) => PurchaseItemModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  paymentModels:
      (json['PaymentsModel'] as List<dynamic>?)
          ?.map((e) => PaymentModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  id: (json['id'] as num).toInt(),
  date: DateTime.parse(json['date'] as String),
  notes: json['notes'] as String?,
  amount: (json['amount'] as num).toDouble(),
  method: json['method'] as String,
);

Map<String, dynamic> _$PaymentModelToJson(PaymentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'amount': instance.amount,
      'method': instance.method,
      'notes': instance.notes,
      'ItemsModel': instance.purchaseItemModels,
      'PaymentsModel': instance.paymentModels,
    };
