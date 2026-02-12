import 'package:json_annotation/json_annotation.dart';

part 'payment_allocation.g.dart';

@JsonSerializable()
class PaymentAllocation {
  final int id;
  final int paymentId;
  final int invoiceId;
  final double amountAllocated;

  PaymentAllocation({
    required this.id,
    required this.paymentId,
    required this.invoiceId,
    required this.amountAllocated,
  });

  factory PaymentAllocation.fromJson(Map<String, dynamic> json) =>
      _$PaymentAllocationFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentAllocationToJson(this);
}
