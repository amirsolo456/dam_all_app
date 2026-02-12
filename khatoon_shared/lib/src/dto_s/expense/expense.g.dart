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
);

Map<String, dynamic> _$ExpenseToJson(Expense instance) => <String, dynamic>{
  'id': instance.id,
  'date': instance.date.toIso8601String(),
  'category': instance.category,
  'amount': instance.amount,
  'notes': instance.notes,
};
