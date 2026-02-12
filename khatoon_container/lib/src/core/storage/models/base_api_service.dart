import 'package:dio/dio.dart';

abstract class BaseApiService {
  Future<Response<List<T>>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future<Response<List<T>>> post<T>(
    String path, {
    dynamic data,
    Options? options,
  });

  Future<Response<List<T>>> put<T>(
    String path, {
    dynamic data,
    Options? options,
  });

  Future<Response<List<T>>> delete<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future<String> refreshToken();

  Future<bool> validateToken();
}
