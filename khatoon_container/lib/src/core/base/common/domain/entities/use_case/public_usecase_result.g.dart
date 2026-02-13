// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_usecase_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublicUseCaseResult<T> _$PublicUseCaseResultFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => PublicUseCaseResult<T>(
  state: $enumDecode(_$UseCaseStateEnumMap, json['state']),
  message: json['message'] as String?,
  error: json['error'] == null
      ? null
      : SerializableError.fromJson(json['error'] as Map<String, dynamic>),
  data: _$nullableGenericFromJson(json['data'], fromJsonT),
);

Map<String, dynamic> _$PublicUseCaseResultToJson<T>(
  PublicUseCaseResult<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'state': _$UseCaseStateEnumMap[instance.state]!,
  'message': instance.message,
  'error': instance.error,
  'data': _$nullableGenericToJson(instance.data, toJsonT),
};

const _$UseCaseStateEnumMap = {
  UseCaseState.success: 'success',
  UseCaseState.failure: 'failure',
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) => input == null ? null : toJson(input);
