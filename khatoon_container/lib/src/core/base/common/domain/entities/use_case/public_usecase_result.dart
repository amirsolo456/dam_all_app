import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_container/src/core/base/common/domain/entities/enums.dart';
import 'package:khatoon_container/src/core/base/common/domain/entities/serializable/serializable_result.dart';
part 'public_usecase_result.g.dart';




@JsonSerializable(genericArgumentFactories: true)
class PublicUseCaseResult<T> {
  final UseCaseState state;
  final String? message;
  final SerializableError? error;
  final T? data;

  PublicUseCaseResult({
    required this.state,
    this.message,
    this.error,
    this.data,
  });

  factory PublicUseCaseResult.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$PublicUseCaseResultFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$PublicUseCaseResultToJson(this, toJsonT);
}
