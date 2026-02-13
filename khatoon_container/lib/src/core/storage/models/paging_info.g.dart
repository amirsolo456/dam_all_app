// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paging_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagingInfo _$PagingInfoFromJson(Map<String, dynamic> json) => PagingInfo(
  onlyTotalCount: json['onlyTotalCount'] as bool?,
  pageNumber: (json['pageNumber'] as num?)?.toInt(),
  pageRecordCount: (json['pageRecordCount'] as num?)?.toInt(),
  startIndex: (json['startIndex'] as num?)?.toInt(),
  totalRowCount: (json['totalRowCount'] as num?)?.toInt(),
  withTotalCount: json['withTotalCount'] as bool?,
);

Map<String, dynamic> _$PagingInfoToJson(PagingInfo instance) =>
    <String, dynamic>{
      'onlyTotalCount': instance.onlyTotalCount,
      'pageRecordCount': instance.pageRecordCount,
      'pageNumber': instance.pageNumber,
      'startIndex': instance.startIndex,
      'withTotalCount': instance.withTotalCount,
      'totalRowCount': instance.totalRowCount,
    };
