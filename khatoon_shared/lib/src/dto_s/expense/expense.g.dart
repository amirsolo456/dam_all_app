// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Expense _$ExpenseFromJson(Map json) => Expense(
  id: (json['id'] as num).toInt(),
  date: DateTime.parse(json['date'] as String),
  category: json['category'] as String,
  amount: (json['amount'] as num).toDouble(),
  notes: json['notes'] as String?,
  relatedInvoiceId: (json['relatedInvoiceId'] as num?)?.toInt(),
  version: (json['version'] as num).toInt(),
  isDeleted: json['isDeleted'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$ExpenseToJson(Expense instance) => <String, dynamic>{
  'id': instance.id,
  'date': instance.date.toIso8601String(),
  'category': instance.category,
  'amount': instance.amount,
  'notes': instance.notes,
  'relatedInvoiceId': instance.relatedInvoiceId,
  'version': instance.version,
  'isDeleted': instance.isDeleted,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};
