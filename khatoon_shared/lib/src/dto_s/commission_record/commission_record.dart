import 'package:json_annotation/json_annotation.dart';

part 'commission_record.g.dart';

@JsonSerializable()
class CommissionRecord {
  final int id;
  final int employeeId;
  final int invoiceId;
  final double calculatedAmount;
  final double paidAmount;

  CommissionRecord({
    required this.id,
    required this.employeeId,
    required this.invoiceId,
    required this.calculatedAmount,
    required this.paidAmount,
  });

  factory CommissionRecord.fromJson(Map<String, dynamic> json) =>
      _$CommissionRecordFromJson(json);

  Map<String, dynamic> toJson() => _$CommissionRecordToJson(this);
}
