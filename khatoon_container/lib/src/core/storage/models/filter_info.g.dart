// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterInfo _$FilterInfoFromJson(Map json) => FilterInfo(
  colName: json['colName'] as String?,
  filterType: json['filterType'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$FilterInfoToJson(FilterInfo instance) =>
    <String, dynamic>{
      'colName': instance.colName,
      'filterType': instance.filterType,
      'value': instance.value,
    };
