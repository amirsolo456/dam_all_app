import 'package:dart_frog/dart_frog.dart';
import 'package:khatoon_server/src/db/database.dart';


Future<Response> onRequest(RequestContext context) async {
  final db = DatabaseService();

  if (context.request.method == HttpMethod.get) {
    final result = await db.execute('SELECT * FROM parties');
    print(result.length);
    return  Response.json(body: result);
  }

  if (context.request.method == 'POST') {
    final body = await context.request.json() as Map<String, dynamic>;
    // اعتبارسنجی و insert
    final    affected = await db.execute(
      '''
        INSERT INTO parties (name, type, phone, address)
        VALUES (@name, @type, @phone, @address)
      ''',
     params:    <String, dynamic>{
        'name': body['name'],
        'type': body['type'] ?? 'customer',
        'phone': body['phone'],
        'address': body['address'],
      },
    );

    return Response.json(body: <String, Object>{'status': 'created', 'affected': affected});
  }

  return Response(statusCode: 405);
}
