

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_related.g.dart';
@JsonSerializable()
class RelatedProduct extends Equatable {
  @JsonKey(required: true)
  final String id;

  @JsonKey(required: true)
  final String title;

  @JsonKey(required: true)
  final double price;

  final String? imageUrl;

  RelatedProduct({
    required this.id,
    required this.title,
    required this.price,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [id, title, price, imageUrl];

  factory RelatedProduct.fromJson(Map<String, dynamic> json) => _$RelatedProductFromJson(json);
  Map<String, dynamic> toJson() => _$RelatedProductToJson(this);
}