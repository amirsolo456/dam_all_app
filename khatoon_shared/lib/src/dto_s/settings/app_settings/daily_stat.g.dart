// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_stat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyStat _$DailyStatFromJson(Map json) {
  $checkKeys(json, requiredKeys: const ['date', 'orders', 'revenue']);
  return DailyStat(
    date: const DateTimeConverter().fromJson(json['date'] as String),
    orders: (json['orders'] as num).toInt(),
    revenue: (json['revenue'] as num).toDouble(),
  );
}

Map<String, dynamic> _$DailyStatToJson(DailyStat instance) => <String, dynamic>{
  'date': const DateTimeConverter().toJson(instance.date),
  'orders': instance.orders,
  'revenue': instance.revenue,
};
