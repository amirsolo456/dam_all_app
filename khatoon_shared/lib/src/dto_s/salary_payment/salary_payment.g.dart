// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salary_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalaryPayment _$SalaryPaymentFromJson(Map json) => SalaryPayment(
  id: (json['id'] as num).toInt(),
  employeeId: (json['employeeId'] as num).toInt(),
  amountPaid: (json['amountPaid'] as num).toDouble(),
  datePaid: json['datePaid'] == null
      ? null
      : DateTime.parse(json['datePaid'] as String),
  periodStart: DateTime.parse(json['periodStart'] as String),
  periodEnd: DateTime.parse(json['periodEnd'] as String),
  notes: json['notes'] as String?,
  version: (json['version'] as num).toInt(),
  isDeleted: json['isDeleted'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$SalaryPaymentToJson(SalaryPayment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employeeId': instance.employeeId,
      'amountPaid': instance.amountPaid,
      'datePaid': instance.datePaid?.toIso8601String(),
      'periodStart': instance.periodStart.toIso8601String(),
      'periodEnd': instance.periodEnd.toIso8601String(),
      'notes': instance.notes,
      'version': instance.version,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
