// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_related.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelatedProduct _$RelatedProductFromJson(Map json) {
  $checkKeys(json, requiredKeys: const ['id', 'title', 'price']);
  return RelatedProduct(
    id: json['id'] as String,
    title: json['title'] as String,
    price: (json['price'] as num).toDouble(),
    imageUrl: json['imageUrl'] as String?,
  );
}

Map<String, dynamic> _$RelatedProductToJson(RelatedProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
    };
