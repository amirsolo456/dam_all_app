// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Filters _$FiltersFromJson(Map json) => Filters(
  filterInfo: (json['filterInfo'] as List<dynamic>?)
      ?.map((e) => FilterInfo.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList(),
  showOnlyBookmarked: json['showOnlyBookmarked'] as bool?,
  tagIdsFilter: (json['tagIdsFilter'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
);

Map<String, dynamic> _$FiltersToJson(Filters instance) => <String, dynamic>{
  'filterInfo': instance.filterInfo?.map((e) => e.toJson()).toList(),
  'showOnlyBookmarked': instance.showOnlyBookmarked,
  'tagIdsFilter': instance.tagIdsFilter,
};
