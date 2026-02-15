import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
// ignore: must_be_immutable
class BaseResponse<T> extends Equatable {
  T? data;
  int? statusCode;
  String? message;

  BaseResponse({this.statusCode, this.data, this.message});

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonD,
  ) => _$BaseResponseFromJson(json, fromJsonD);

  Map<String, dynamic> toJson(
    Object? Function(T value) toJsonD,
  ) => _$BaseResponseToJson(this, toJsonD);

  @override
  List<Object?> get props => [data, statusCode, message];
}
