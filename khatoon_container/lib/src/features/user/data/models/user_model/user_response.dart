// ignore_for_file: must_be_immutable

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:khatoon_container/src/core/storage/models/base_request.dart';
import 'package:khatoon_shared/index.dart';


class UserResponse extends Response<User> {
  UserResponse({
    required super.data,
    required super.statusMessage,
    required super.statusCode,
    required super.requestOptions,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      data: User.fromJson(json['data'] ?? <User>[]),
      statusMessage: json['statusMessage'],
      statusCode: json['statusCode'],
      requestOptions: RequestOptions(),
    );
  }
}

@immutable
class UserRequest extends BaseRequest {
  final User user;

    UserRequest(this.user);

  @override
  Map<String, dynamic> toJson() => user.toJson();
}
