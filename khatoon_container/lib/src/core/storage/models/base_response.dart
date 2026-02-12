import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class BaseResponse<T> extends Equatable {
  List<T> data;
  int? statusCode;
  String? message;

  BaseResponse({this.statusCode, required this.data, this.message});

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonD,
  ) => _$BaseResponseFromJson(json , fromJsonD   );

  Map<String, dynamic> toJson(
    Map<String, dynamic>? Function(T value) toJsonD,
  ) => _$BaseResponseToJson(this, toJsonD);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
