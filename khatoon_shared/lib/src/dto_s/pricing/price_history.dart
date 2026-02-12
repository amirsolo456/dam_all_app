


import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_shared/index.dart';

part 'price_history.g.dart';
@JsonSerializable()
class PriceHistory extends Equatable {
  @DateTimeConverter()
  @JsonKey(required: true)
  final DateTime date;

  @JsonKey(required: true)
  final double price;

  final String? note;

  const PriceHistory({
    required this.date,
    required this.price,
    this.note,
  });

  @override
  List<Object?> get props => [date, price, note];

  factory PriceHistory.fromJson(Map<String, dynamic> json) => _$PriceHistoryFromJson(json);
  Map<String, dynamic> toJson() => _$PriceHistoryToJson(this);
}