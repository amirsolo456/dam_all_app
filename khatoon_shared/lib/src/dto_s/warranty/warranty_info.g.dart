// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warranty_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarrantyInfo _$WarrantyInfoFromJson(Map json) {
  $checkKeys(json, requiredKeys: const ['durationMonths', 'description']);
  return WarrantyInfo(
    durationMonths: (json['durationMonths'] as num).toInt(),
    description: json['description'] as String,
    coveredItems:
        (json['coveredItems'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        const <String>[],
    excludedItems:
        (json['excludedItems'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        const <String>[],
  );
}

Map<String, dynamic> _$WarrantyInfoToJson(WarrantyInfo instance) =>
    <String, dynamic>{
      'durationMonths': instance.durationMonths,
      'description': instance.description,
      'coveredItems': instance.coveredItems,
      'excludedItems': instance.excludedItems,
    };
