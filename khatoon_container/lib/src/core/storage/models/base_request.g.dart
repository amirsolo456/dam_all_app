// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseRequest _$BaseRequestFromJson(Map json) =>
    BaseRequest(
        defaults: json['defaults'] == null
            ? null
            : Defaults.fromJson(
                Map<String, dynamic>.from(json['defaults'] as Map),
              ),
        orderInfo: json['orderInfo'] == null
            ? null
            : OrderInfo.fromJson(
                Map<String, dynamic>.from(json['orderInfo'] as Map),
              ),
        filters: json['filters'] == null
            ? null
            : Filters.fromJson(
                Map<String, dynamic>.from(json['filters'] as Map),
              ),
      )
      ..pagingInfo = json['pagingInfo'] == null
          ? null
          : PagingInfo.fromJson(
              Map<String, dynamic>.from(json['pagingInfo'] as Map),
            );

Map<String, dynamic> _$BaseRequestToJson(BaseRequest instance) =>
    <String, dynamic>{
      'filters': instance.filters?.toJson(),
      'pagingInfo': instance.pagingInfo?.toJson(),
      'orderInfo': instance.orderInfo?.toJson(),
      'defaults': instance.defaults?.toJson(),
    };
