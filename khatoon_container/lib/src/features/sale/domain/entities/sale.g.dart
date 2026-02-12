// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sale _$SaleFromJson(Map json) => Sale(
  invoices: (json['invoices'] as List<dynamic>)
      .map((e) => InvoiceLine.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList(),
  invoice: Invoice.fromJson(Map<String, dynamic>.from(json['invoice'] as Map)),
  payments: (json['payments'] as List<dynamic>)
      .map((e) => Payment.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList(),
);

Map<String, dynamic> _$SaleToJson(Sale instance) => <String, dynamic>{
  'invoices': instance.invoices.map((e) => e.toJson()).toList(),
  'invoice': instance.invoice.toJson(),
  'payments': instance.payments.map((e) => e.toJson()).toList(),
};
