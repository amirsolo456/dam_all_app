// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializable_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SerializableError _$SerializableErrorFromJson(Map<String, dynamic> json) =>
    SerializableError(
      message: json['message'] as String,
      stackTrace: json['stackTrace'] as String?,
    );

Map<String, dynamic> _$SerializableErrorToJson(SerializableError instance) =>
    <String, dynamic>{
      'message': instance.message,
      'stackTrace': instance.stackTrace,
    };
