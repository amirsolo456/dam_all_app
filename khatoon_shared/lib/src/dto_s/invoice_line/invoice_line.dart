import 'package:json_annotation/json_annotation.dart';

part 'invoice_line.g.dart';

@JsonSerializable()
class InvoiceLine {
  final int id;
  final int invoiceId;
  final int? productId;
  final String? description;
  final double quantity;
  double get qty => quantity;
  final double unitPrice;
  final double lineTotal;
  final int? partyId;
  final int? sellerEmployeeId;
  final int version;
  final bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  InvoiceLine({
    required this.id,
    required this.invoiceId,
    this.productId,
    this.description,
    required this.quantity,
    required this.unitPrice,
    required this.lineTotal,
    this.partyId,
    this.sellerEmployeeId,
    required this.version,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory InvoiceLine.fromJson(Map<String, dynamic> json) =>
      _$InvoiceLineFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceLineToJson(this);
}
