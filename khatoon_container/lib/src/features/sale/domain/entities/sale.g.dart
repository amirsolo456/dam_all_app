// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sale _$SaleFromJson(Map<String, dynamic> json) => Sale(
  invoices: (json['invoices'] as List<dynamic>)
      .map((e) => InvoiceLine.fromJson(e as Map<String, dynamic>))
      .toList(),
  invoice: Invoice.fromJson(json['invoice'] as Map<String, dynamic>),
  payments: (json['payments'] as List<dynamic>)
      .map((e) => Payment.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SaleToJson(Sale instance) => <String, dynamic>{
  'invoices': instance.invoices,
  'invoice': instance.invoice,
  'payments': instance.payments,
};
