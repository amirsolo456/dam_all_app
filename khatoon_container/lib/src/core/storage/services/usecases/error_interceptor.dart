import 'package:dio/dio.dart';

class ErrorHandlerInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final Response<dynamic>? response = err.response;

    if (response != null) {
      final String errorMessage = _parseErrorMessage(response.data);
      final int? statusCode = response.statusCode;

      // Handle different error types
      switch (statusCode) {
        case 400:
          handler.reject(BadRequestException(err.requestOptions, errorMessage));
          break;
        case 404:
          handler.reject(NotFoundException(err.requestOptions, errorMessage));
          break;
        case 500:
          handler.reject(ServerException(err.requestOptions, errorMessage));
          break;
        default:
          handler.reject(AppException(err.requestOptions, errorMessage));
      }
    } else {
      handler.reject(NetworkException(err.requestOptions, err.message ?? ''));
    }
  }

  String _parseErrorMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data['message'] ?? 'Unknown error';
    }
    return 'Unknown error';
  }
}

class NotFoundException extends DioException {
  NotFoundException(RequestOptions r, String message)
      : super(requestOptions: r, message: message);
}

class ServerException extends DioException {
  ServerException(RequestOptions r, String message)
      : super(requestOptions: r, message: message);
}

class NetworkException extends DioException {
  NetworkException(RequestOptions r, String message)
      : super(requestOptions: r, message: message);
}

class AppException extends DioException {
  AppException(RequestOptions r, String message)
      : super(requestOptions: r, message: message);
}

class BadRequestException extends AppException {
  BadRequestException(super.r, super.message);
}
