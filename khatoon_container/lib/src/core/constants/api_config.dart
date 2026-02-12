// lib/core/config/remote_config_service.dart
import 'package:dio/dio.dart';

class  ApiConfig {
  Map<String, dynamic>? _endpoints;

  Future<void> load() async {
    final Dio dio = Dio();
    final Response<dynamic> response = await dio.get('https://api.damdari.com/api/v1/config');
    _endpoints = response.data['endpoints'];
  }

  String get usersEndpoint => _endpoints?['users'] ?? '/users';
  String userByIdEndpoint(int id) => '${_endpoints?['users'] ?? '/users'}/$id';
}