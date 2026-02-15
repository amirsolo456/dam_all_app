import 'package:json_annotation/json_annotation.dart';

part 'payment.g.dart';

@JsonSerializable()
class Payment {
  final int id;
  final DateTime date;
  final double amount;
  final String direction;
  final String? paymentMethod;
  final int? fromPartyId;
  final int? toPartyId;
  final String? reference;
  final String? notes;
  final int version;
  final bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  Payment({
    required this.id,
    required this.date,
    required this.amount,
    required this.direction,
    this.paymentMethod,
    this.fromPartyId,
    this.toPartyId,
    this.reference,
    this.notes,
    required this.version,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}
