// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map json) => Employee(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  role: json['role'] as String?,
  salaryAmount: (json['salaryAmount'] as num?)?.toDouble(),
  isCommissioned: json['isCommissioned'] as bool,
  commissionPercent: (json['commissionPercent'] as num?)?.toDouble(),
  notes: json['notes'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  version: (json['version'] as num).toInt(),
  isDeleted: json['isDeleted'] as bool,
);

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'role': instance.role,
  'salaryAmount': instance.salaryAmount,
  'isCommissioned': instance.isCommissioned,
  'commissionPercent': instance.commissionPercent,
  'notes': instance.notes,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'version': instance.version,
  'isDeleted': instance.isDeleted,
};
