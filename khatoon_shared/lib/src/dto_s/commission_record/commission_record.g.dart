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
  version: (json['version'] as num).toInt(),
  isDeleted: json['isDeleted'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$CommissionRecordToJson(CommissionRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employeeId': instance.employeeId,
      'invoiceId': instance.invoiceId,
      'calculatedAmount': instance.calculatedAmount,
      'paidAmount': instance.paidAmount,
      'version': instance.version,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
