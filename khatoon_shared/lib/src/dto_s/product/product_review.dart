

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_shared/index.dart';

part 'product_review.g.dart';
@JsonSerializable()
class ProductReview extends Equatable {
  @JsonKey(required: true)
  final String id;

  @JsonKey(required: true)
  final String userId;

  @JsonKey(required: true)
  final String userName;

  final String? userImage;

  @JsonKey(required: true)
  final double rating;

  @JsonKey(required: true)
  final String comment;

  @DateTimeConverter()
  @JsonKey(required: true)
  final DateTime date;

  @JsonKey()
  final List<String>? images;

  @JsonKey(defaultValue: false)
  final bool isVerifiedPurchase;

  const ProductReview({
    required this.id,
    required this.userId,
    required this.userName,
    this.userImage,
    required this.rating,
    required this.comment,
    required this.date,
    this.images,
    this.isVerifiedPurchase = false,
  });

  @override
  List<Object?> get props => [
    id,
    userId,
    userName,
    userImage,
    rating,
    comment,
    date,
    images,
    isVerifiedPurchase,
  ];

  factory ProductReview.fromJson(Map<String, dynamic> json) => _$ProductReviewFromJson(json);
  Map<String, dynamic> toJson() => _$ProductReviewToJson(this);
}