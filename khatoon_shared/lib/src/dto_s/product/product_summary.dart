import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_summary.g.dart';

@JsonSerializable()
class ProductSummary extends Equatable {
  @JsonKey(required: true)
  final String id;

  @JsonKey(required: true)
  final String title;

  @JsonKey(required: true)
  final double price;

  @JsonKey(required: true)
  final int stock;

  final String? thumbnailUrl;

  @JsonKey(defaultValue: 0.0)
  final double rating;

  @JsonKey(defaultValue: 0)
  final int reviewCount;

  @JsonKey(defaultValue: false)
  final bool isFavorite;

  const ProductSummary({
    required this.id,
    required this.title,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.isFavorite,
    this.thumbnailUrl,

    required this.stock,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    price,
    stock,
    thumbnailUrl,
    rating,
    reviewCount,
    isFavorite,
  ];

  factory ProductSummary.fromJson(Map<String, dynamic> json) =>
      _$ProductSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$ProductSummaryToJson(this);
}
