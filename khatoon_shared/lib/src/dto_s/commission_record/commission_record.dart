import 'package:json_annotation/json_annotation.dart';

part 'commission_record.g.dart';

@JsonSerializable()
class CommissionRecord {
  final int id;
  final int employeeId;
  final int invoiceId;
  final double calculatedAmount;
  final double paidAmount;
  final int version;
  final bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  CommissionRecord({
    required this.id,
    required this.employeeId,
    required this.invoiceId,
    required this.calculatedAmount,
    required this.paidAmount,
    required this.version,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CommissionRecord.fromJson(Map<String, dynamic> json) =>
      _$CommissionRecordFromJson(json);

  Map<String, dynamic> toJson() => _$CommissionRecordToJson(this);
}
