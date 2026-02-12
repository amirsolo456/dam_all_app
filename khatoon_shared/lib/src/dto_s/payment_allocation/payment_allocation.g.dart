// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_allocation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentAllocation _$PaymentAllocationFromJson(Map json) => PaymentAllocation(
  id: (json['id'] as num).toInt(),
  paymentId: (json['paymentId'] as num).toInt(),
  invoiceId: (json['invoiceId'] as num).toInt(),
  amountAllocated: (json['amountAllocated'] as num).toDouble(),
);

Map<String, dynamic> _$PaymentAllocationToJson(PaymentAllocation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'paymentId': instance.paymentId,
      'invoiceId': instance.invoiceId,
      'amountAllocated': instance.amountAllocated,
    };
