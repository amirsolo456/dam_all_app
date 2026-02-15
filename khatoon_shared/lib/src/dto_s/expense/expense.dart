import 'package:json_annotation/json_annotation.dart';

part 'expense.g.dart';

@JsonSerializable()
class Expense {
  final int id;
  final DateTime date;
  final String category;
  final double amount;
  final String? notes;
  final int? relatedInvoiceId;
  final int version;
  final bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  Expense({
    required this.id,
    required this.date,
    required this.category,
    required this.amount,
    this.notes,
    this.relatedInvoiceId,
    required this.version,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Expense.fromJson(Map<String, dynamic> json) =>
      _$ExpenseFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseToJson(this);
}
