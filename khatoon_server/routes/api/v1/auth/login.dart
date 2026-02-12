// routes/api/v1/auth/login.dart
import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:khatoon_server/src/services/auth/auth_service.dart';

import 'package:uuid/uuid.dart';
Handler handler = (RequestContext context) async {
  // منطق شما اینجا
  // مثلاً:
  if (context.request.method == HttpMethod.post) {
    // پردازش درخواست
    return Response.json(body: <String, String>{'status': 'success'});
  }

  return Response(statusCode: 405, body: 'Method Not Allowed');
};

Future<Response> onRequest(RequestContext context) async {
  final body = await context.request.json() as Map<String, dynamic>;
  final email = body['email']?.toString();
  final password = body['password']?.toString();

  if (email == null || password == null) {
    return Response(statusCode: HttpStatus.badRequest, body: 'missing credentials');
  }

  // for demo: accept any creds and produce token (in prod validate against users table)
  final auth = AuthService(Platform.environment['JWT_SECRET'] ?? 'secret_example_key');
  final userId = const Uuid().v4();
  final token = auth.generateToken(userId);

  return Response.json(body: <String, String>{'accessToken': token});
}
