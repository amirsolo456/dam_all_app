
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'shipping_info.g.dart';
@JsonSerializable()
class ShippingInfo extends Equatable {
  @JsonKey(defaultValue: 0.0)
  final double cost;

  @JsonKey(defaultValue: false)
  final bool freeShipping;

  @JsonKey(defaultValue: 0.0)
  final double freeShippingThreshold;

  @JsonKey(defaultValue: ['پست', 'تیپاکس'])
  final List<String> availableMethods;

  @JsonKey(defaultValue: 2)
  final int estimatedDaysMin;

  @JsonKey(defaultValue: 5)
  final int estimatedDaysMax;

  ShippingInfo({
    this.cost = 0.0,
    this.freeShipping = false,
    this.freeShippingThreshold = 0.0,
    this.availableMethods = const ['پست', 'تیپاکس'],
    this.estimatedDaysMin = 2,
    this.estimatedDaysMax = 5,
  });

  @override
  List<Object?> get props => [
    cost,
    freeShipping,
    freeShippingThreshold,
    availableMethods,
    estimatedDaysMin,
    estimatedDaysMax,
  ];

  factory ShippingInfo.fromJson(Map<String, dynamic> json) => _$ShippingInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ShippingInfoToJson(this);
}