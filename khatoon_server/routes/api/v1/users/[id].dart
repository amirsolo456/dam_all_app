import 'package:dart_frog/dart_frog.dart';

// Handler handler = (RequestContext context) async {
//   // منطق شما اینجا
//   // مثلاً:
//   if (context.request.method == HttpMethod.post) {
//     // پردازش درخواست
//     return Response.json(body: {'status': 'success'});
//   }
//
//   return Response(statusCode: 405, body: 'Method Not Allowed');
// };

Future<Response> onRequest(RequestContext context, String id) async {
  // Use 'id' here, e.g., fetch user by ID
  return Response.json(body: <String, String>{'user_id': id});
}
