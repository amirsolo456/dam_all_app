// routes/api/v1/invoices/index.dart
import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:khatoon_server/src/db/database.dart';
import 'package:khatoon_server/src/services/invoice_repository.dart';
import 'package:khatoon_shared/index.dart';

// Handler handler = (RequestContext context) async {
//   // منطق شما اینجا
//   // مثلاً:
//   if (context.request.method == HttpMethod.post) {
//     // پردازش درخواست
//     return Response.json(body: <String, String>{'status': 'success'});
//   }
//
//   return Response(statusCode: 405, body: 'Method Not Allowed');
// };

Future<Response> onRequest(RequestContext context) async {
  final method = context.request.method;
  final db =DatabaseService();

  if (method == HttpMethod.get) {
    final rows = await db.execute(
      'SELECT TOP 100 * FROM invoices ORDER BY updated_at DESC',
    );

    final invoices = rows.map((r) => Invoice.fromJson(r).toJson()).toList();

    return Response.json(body: invoices);
  }

  if (method == HttpMethod.post) {
    final body = await context.request.json() as Map<String, dynamic>;

    final now = DateTime.now().toIso8601String();
    body['createdAt'] ??= now;
    body['updatedAt'] = now;
    body['version'] ??= 0;

    final invoiceService = InvoiceService(db);
    await invoiceService.insertInvoice(body);

    return Response.json(
      body: {'ok': true},
      statusCode: HttpStatus.created,
    );
  }

  return Response(
    statusCode: HttpStatus.methodNotAllowed,
  );
}
