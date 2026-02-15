import 'package:json_annotation/json_annotation.dart';

part 'salary_payment.g.dart';

@JsonSerializable()
class SalaryPayment {
  final int id;
  final int employeeId;
  final double amountPaid;
  final DateTime? datePaid;
  final DateTime periodStart;
  final DateTime periodEnd;
  final String? notes;
  final int version;
  final bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  SalaryPayment({
    required this.id,
    required this.employeeId,
    required this.amountPaid,
    this.datePaid,
    required this.periodStart,
    required this.periodEnd,
    this.notes,
    required this.version,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SalaryPayment.fromJson(Map<String, dynamic> json) =>
      _$SalaryPaymentFromJson(json);

  Map<String, dynamic> toJson() => _$SalaryPaymentToJson(this);
}
