// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingInfo _$ShippingInfoFromJson(Map json) => ShippingInfo(
  cost: (json['cost'] as num?)?.toDouble() ?? 0.0,
  freeShipping: json['freeShipping'] as bool? ?? false,
  freeShippingThreshold:
      (json['freeShippingThreshold'] as num?)?.toDouble() ?? 0.0,
  availableMethods:
      (json['availableMethods'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      ['پست', 'تیپاکس'],
  estimatedDaysMin: (json['estimatedDaysMin'] as num?)?.toInt() ?? 2,
  estimatedDaysMax: (json['estimatedDaysMax'] as num?)?.toInt() ?? 5,
);

Map<String, dynamic> _$ShippingInfoToJson(ShippingInfo instance) =>
    <String, dynamic>{
      'cost': instance.cost,
      'freeShipping': instance.freeShipping,
      'freeShippingThreshold': instance.freeShippingThreshold,
      'availableMethods': instance.availableMethods,
      'estimatedDaysMin': instance.estimatedDaysMin,
      'estimatedDaysMax': instance.estimatedDaysMax,
    };
