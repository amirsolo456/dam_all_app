import 'package:json_annotation/json_annotation.dart';

part 'invoice_line.g.dart';

@JsonSerializable()
class InvoiceLine {
  final int id;
  final int invoiceId;
  final int productId;
  final double qty;
  final double unitPrice;
  final double lineTotal;

  InvoiceLine({
    required this.id,
    required this.invoiceId,
    required this.productId,
    required this.qty,
    required this.unitPrice,
    required this.lineTotal,
  });

  factory InvoiceLine.fromJson(Map<String, dynamic> json) =>
      _$InvoiceLineFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceLineToJson(this);
}
