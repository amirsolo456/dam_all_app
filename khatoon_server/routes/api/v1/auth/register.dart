import 'package:dart_frog/dart_frog.dart';

Handler handler = (RequestContext context) async {
  // منطق شما
  switch (context.request.method.value) {
    case 'POST':
    // پردازش ثبت‌نام
      return Response.json(body: <String, String>{'message': 'registered'});
    default:
      return Response(statusCode: 405);
  }
};
Future<Response> onRequest(RequestContext context) async {
  return Response.json(  );
}
