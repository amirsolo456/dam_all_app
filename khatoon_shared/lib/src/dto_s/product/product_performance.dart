import 'package:json_annotation/json_annotation.dart';
part 'product_performance.g.dart';

@JsonSerializable()
class ProductPerformance {
  @JsonKey(required: true)
  final String productId;

  @JsonKey(required: true)
  final String productName;

  @JsonKey(required: true)
  final int sales;

  @JsonKey(required: true)
  final double revenue;

  @JsonKey(defaultValue: 0.0)
  final double growthRate;

  ProductPerformance({
    required this.productId,
    required this.productName,
    required this.sales,
    required this.revenue,
    this.growthRate = 0.0,
  });

  factory ProductPerformance.fromJson(Map<String, dynamic> json) => _$ProductPerformanceFromJson(json);
  Map<String, dynamic> toJson() => _$ProductPerformanceToJson(this);

  // Map<String, dynamic> toMap() {
  //   return {
  //     'productId': productId,
  //     'productName': productName,
  //     'sales': sales,
  //     'revenue': revenue,
  //     'growthRate': growthRate,
  //   };
  // }

  // factory ProductPerformance.fromMap(Map<String, dynamic> map) {
  //   return ProductPerformance(
  //     productId: map['productId'] as String,
  //     productName: map['productName'] as String,
  //     sales: (map['sales'] as num).toInt(),
  //     revenue: (map['revenue'] as num).toDouble(),
  //     growthRate: (map['growthRate'] as num).toDouble(),
  //   );
  // }
}