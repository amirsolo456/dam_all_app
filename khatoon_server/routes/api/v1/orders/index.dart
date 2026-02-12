import 'package:dart_frog/dart_frog.dart';

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
  return Response.json(  );
}