// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salary_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalaryPayment _$SalaryPaymentFromJson(Map json) => SalaryPayment(
  id: (json['id'] as num).toInt(),
  employeeId: (json['employeeId'] as num).toInt(),
  periodStart: DateTime.parse(json['periodStart'] as String),
  periodEnd: DateTime.parse(json['periodEnd'] as String),
  amountPaid: (json['amountPaid'] as num).toDouble(),
  datePaid: DateTime.parse(json['datePaid'] as String),
);

Map<String, dynamic> _$SalaryPaymentToJson(SalaryPayment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employeeId': instance.employeeId,
      'periodStart': instance.periodStart.toIso8601String(),
      'periodEnd': instance.periodEnd.toIso8601String(),
      'amountPaid': instance.amountPaid,
      'datePaid': instance.datePaid.toIso8601String(),
    };
