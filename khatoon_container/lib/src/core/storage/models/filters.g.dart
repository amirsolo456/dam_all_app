// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Filters _$FiltersFromJson(Map<String, dynamic> json) => Filters(
  filterInfo: (json['filterInfo'] as List<dynamic>?)
      ?.map((e) => FilterInfo.fromJson(e as Map<String, dynamic>))
      .toList(),
  showOnlyBookmarked: json['showOnlyBookmarked'] as bool?,
  tagIdsFilter: (json['tagIdsFilter'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
);

Map<String, dynamic> _$FiltersToJson(Filters instance) => <String, dynamic>{
  'filterInfo': instance.filterInfo,
  'showOnlyBookmarked': instance.showOnlyBookmarked,
  'tagIdsFilter': instance.tagIdsFilter,
};
