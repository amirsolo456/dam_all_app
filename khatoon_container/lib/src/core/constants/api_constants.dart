class ApiConstants {
  static const String baseUrl = 'https://your-api.com/api';
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);
  static const Map<String, String> defaultHeaders = <String, String>{
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}