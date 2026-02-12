// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map json) => Product(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  unit: json['unit'] as String,
  price: (json['price'] as num).toDouble(),
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'unit': instance.unit,
  'price': instance.price,
};
