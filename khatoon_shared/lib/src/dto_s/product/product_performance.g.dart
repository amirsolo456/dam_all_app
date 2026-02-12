// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_performance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductPerformance _$ProductPerformanceFromJson(Map json) {
  $checkKeys(
    json,
    requiredKeys: const ['productId', 'productName', 'sales', 'revenue'],
  );
  return ProductPerformance(
    productId: json['productId'] as String,
    productName: json['productName'] as String,
    sales: (json['sales'] as num).toInt(),
    revenue: (json['revenue'] as num).toDouble(),
    growthRate: (json['growthRate'] as num?)?.toDouble() ?? 0.0,
  );
}

Map<String, dynamic> _$ProductPerformanceToJson(ProductPerformance instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'sales': instance.sales,
      'revenue': instance.revenue,
      'growthRate': instance.growthRate,
    };
