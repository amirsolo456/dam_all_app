// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceHistory _$PriceHistoryFromJson(Map json) {
  $checkKeys(json, requiredKeys: const ['date', 'price']);
  return PriceHistory(
    date: const DateTimeConverter().fromJson(json['date'] as String),
    price: (json['price'] as num).toDouble(),
    note: json['note'] as String?,
  );
}

Map<String, dynamic> _$PriceHistoryToJson(PriceHistory instance) =>
    <String, dynamic>{
      'date': const DateTimeConverter().toJson(instance.date),
      'price': instance.price,
      'note': instance.note,
    };
