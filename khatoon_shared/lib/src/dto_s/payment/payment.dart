import 'package:json_annotation/json_annotation.dart';

part 'payment.g.dart';

@JsonSerializable()
class Payment {
  final int id;
  final DateTime date;
  final double amount;
  final String method; // cash, card, transfer
  final String? notes;

  Payment({
    required this.id,
    required this.date,
    required this.amount,
    required this.method,
    this.notes,
  });

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}


/*

/// Payment method ساده
class PaymentMethod {
  final String id;
  final String type; // e.g., "card", "paypal", "wallet"
  final String last4;
  final bool isDefault;

  PaymentMethod({
    required this.id,
    required this.type,
    required this.last4,
    this.isDefault = false,
  });

  Map<String, dynamic> toMap() =>
      {'id': id, 'type': type, 'last4': last4, 'isDefault': isDefault};

  factory PaymentMethod.fromMap(Map<String, dynamic> map) => PaymentMethod(
    id: map['id'] as String,
    type: map['type'] as String,
    last4: map['last4'] as String,
    isDefault: map['isDefault'] as bool? ?? false,
  );
}*/
