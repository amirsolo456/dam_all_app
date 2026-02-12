import 'package:dio/dio.dart';
import 'package:khatoon_container/src/core/storage/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
 bool _isRefreshing=false;
class RefreshTokenInterceptor extends Interceptor {
  final ApiService _dioClient;



  RefreshTokenInterceptor(this._dioClient);

  @override
  Future<void> onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) async {
    if (err.response?.statusCode == 401 && !_isRefreshing) {
      _isRefreshing = true;

      try {
        final String newToken = await _dioClient.refreshToken();
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_token', newToken);

        // Retry failed requests
        await _retryFailedRequests();

        handler.resolve(await _retryRequest(err.requestOptions));
      } catch (e) {
        _clearAuthData();
        handler.reject(err);
      } finally {
        _isRefreshing = false;
      }
    } else {
      handler.next(err);
    }
  }

  Future<void> _retryFailedRequests() async {
    // Implementation for retrying queued requests
  }

  Future<Response<dynamic>> _retryRequest(RequestOptions options) async {
    return _dioClient.dio.request<dynamic>(
      options.path,
      data: options.data,
      queryParameters: options.queryParameters,
      options: Options(method: options.method, headers: options.headers),
    );
  }

  void _clearAuthData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    // Navigate to login
  }
}
