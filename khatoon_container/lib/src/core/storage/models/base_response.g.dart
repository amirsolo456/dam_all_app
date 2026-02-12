// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T>(
  Map json,
  T Function(Object? json) fromJsonT,
) => BaseResponse<T>(
  statusCode: (json['statusCode'] as num?)?.toInt(),
  data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
  message: json['message'] as String?,
);

Map<String, dynamic> _$BaseResponseToJson<T>(
  BaseResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'data': instance.data.map(toJsonT).toList(),
  'statusCode': instance.statusCode,
  'message': instance.message,
};
