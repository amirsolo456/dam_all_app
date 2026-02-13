// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseRequest _$BaseRequestFromJson(Map<String, dynamic> json) =>
    BaseRequest(
        defaults: json['defaults'] == null
            ? null
            : Defaults.fromJson(json['defaults'] as Map<String, dynamic>),
        orderInfo: json['orderInfo'] == null
            ? null
            : OrderInfo.fromJson(json['orderInfo'] as Map<String, dynamic>),
        filters: json['filters'] == null
            ? null
            : Filters.fromJson(json['filters'] as Map<String, dynamic>),
      )
      ..pagingInfo = json['pagingInfo'] == null
          ? null
          : PagingInfo.fromJson(json['pagingInfo'] as Map<String, dynamic>);

Map<String, dynamic> _$BaseRequestToJson(BaseRequest instance) =>
    <String, dynamic>{
      'filters': instance.filters,
      'pagingInfo': instance.pagingInfo,
      'orderInfo': instance.orderInfo,
      'defaults': instance.defaults,
    };
