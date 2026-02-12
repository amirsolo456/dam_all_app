import 'dart:async';

import 'package:dio/dio.dart';

import 'package:khatoon_container/src/core/constants/api_constants.dart';
import 'package:khatoon_container/src/core/storage/models/base_api_service.dart';
import 'package:khatoon_container/src/core/storage/services/usecases/auth_interceptor.dart';
import 'package:khatoon_container/src/core/storage/services/usecases/error_interceptor.dart';
import 'package:khatoon_container/src/core/storage/services/usecases/refresh_interceptor.dart';

class ApiService implements BaseApiService {
  static final ApiService _instance = ApiService._();

  factory ApiService() => _instance;

  ApiService._() {
    _initDio();
  }

  late Dio _dio;

  // final List<({Completer completer, RequestOptions options})> _requestQueue =
  //     <({Completer<dynamic> completer, RequestOptions options})>[];

  void _initDio() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: ApiConstants.connectTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        headers: ApiConstants.defaultHeaders,
      ),
    );

    // Add interceptors in order
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );

    _dio.interceptors.add(AuthInterceptor());
    _dio.interceptors.add(RefreshTokenInterceptor(this));
    _dio.interceptors.add(ErrorHandlerInterceptor());
  }

  Dio get dio => _dio;

  @override
  Future<Response<List<T>>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.get<List<T>>(
      path,
      queryParameters: queryParameters,
      options: options,
    );
  }

  @override
  Future<Response<List<T>>> post<T>(
    String path, {
    dynamic data,
    Options? options,
  }) async {
    return await _dio.post<List<T>>(path, data: data, options: options);
  }

  @override
  Future<Response<List<T>>> put<T>(
    String path, {
    dynamic data,
    Options? options,
  }) async {
    return await _dio.put<List<T>>(path, data: data, options: options);
  }

  @override
  Future<Response<List<T>>> delete<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.delete<List<T>>(
      path,
      queryParameters: queryParameters,
      options: options,
    );
  }

  @override
  Future<String> refreshToken() async {
    // Implement token refresh logic
    // Return new token
    throw UnimplementedError();
  }

  @override
  Future<bool> validateToken() async {
    // Implement token validation
    return true;
  }
}

// ... سایر کلاس‌های خطا
