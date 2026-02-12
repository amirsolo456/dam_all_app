// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductSummary _$ProductSummaryFromJson(Map json) {
  $checkKeys(json, requiredKeys: const ['id', 'title', 'price', 'stock']);
  return ProductSummary(
    id: json['id'] as String,
    title: json['title'] as String,
    price: (json['price'] as num).toDouble(),
    rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
    reviewCount: (json['reviewCount'] as num?)?.toInt() ?? 0,
    isFavorite: json['isFavorite'] as bool? ?? false,
    thumbnailUrl: json['thumbnailUrl'] as String?,
    stock: (json['stock'] as num).toInt(),
  );
}

Map<String, dynamic> _$ProductSummaryToJson(ProductSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'stock': instance.stock,
      'thumbnailUrl': instance.thumbnailUrl,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'isFavorite': instance.isFavorite,
    };
