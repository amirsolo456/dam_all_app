import 'package:json_annotation/json_annotation.dart';

part 'employee.g.dart';

@JsonSerializable()
class Employee {
  final int id;
  final String name;
  final String? role;
  final double? salaryAmount;
  final bool isCommissioned;
  final double? commissionPercent;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;
  final bool isDeleted;

  Employee({
    required this.id,
    required this.name,
    this.role,
    this.salaryAmount,
    required this.isCommissioned,
    this.commissionPercent,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
    required this.isDeleted,
  });

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}
