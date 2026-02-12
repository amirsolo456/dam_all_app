import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  // Example logic
  switch (context.request.method) {
    case HttpMethod.get:
      return Response.json(body: <String, String>{'status': 'ok'});
    case HttpMethod.post:
    // handle body, etc.
      final body = await context.request.json();
      return Response.json(body: <String, dynamic>{'received': body});
    default:
      return Response(statusCode: 405);
  }
}
