import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  // Your logic for GET /api/v1/users (list users, etc.)
  return Response.json(body: <String, String>{'message': 'Users list endpoint'});
}
