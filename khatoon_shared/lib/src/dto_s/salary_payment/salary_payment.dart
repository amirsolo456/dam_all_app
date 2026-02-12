import 'package:json_annotation/json_annotation.dart';

part 'salary_payment.g.dart';

@JsonSerializable()
class SalaryPayment {
  final int id;
  final int employeeId;
  final DateTime periodStart;
  final DateTime periodEnd;
  final double amountPaid;
  final DateTime datePaid;

  SalaryPayment({
    required this.id,
    required this.employeeId,
    required this.periodStart,
    required this.periodEnd,
    required this.amountPaid,
    required this.datePaid,
  });

  factory SalaryPayment.fromJson(Map<String, dynamic> json) =>
      _$SalaryPaymentFromJson(json);

  Map<String, dynamic> toJson() => _$SalaryPaymentToJson(this);
}
