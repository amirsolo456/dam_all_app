// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commission_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommissionRecord _$CommissionRecordFromJson(Map json) => CommissionRecord(
  id: (json['id'] as num).toInt(),
  employeeId: (json['employeeId'] as num).toInt(),
  invoiceId: (json['invoiceId'] as num).toInt(),
  calculatedAmount: (json['calculatedAmount'] as num).toDouble(),
  paidAmount: (json['paidAmount'] as num).toDouble(),
);

Map<String, dynamic> _$CommissionRecordToJson(CommissionRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employeeId': instance.employeeId,
      'invoiceId': instance.invoiceId,
      'calculatedAmount': instance.calculatedAmount,
      'paidAmount': instance.paidAmount,
    };
