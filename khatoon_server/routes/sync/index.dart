// routes/sync/index.dart
import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:khatoon_server/src/db/database.dart';
import 'package:khatoon_server/src/services/invoice_repository.dart';
import 'package:khatoon_server/src/services/sync_service.dart';


Future<Response> onRequest(RequestContext context) async {
  // basic auth check (example)
  final authHeader = context.request.headers['authorization'];
  if (authHeader == null || !authHeader.startsWith('Bearer ')) {
    return Response(statusCode: HttpStatus.unauthorized);
  }

  final body = await context.request.json() as Map<String, dynamic>;

  final db = DatabaseService();
  // await db.ensureSchema(); // safe to call multiple times

  // create services once (in prod register singletons)
  final invoiceService = InvoiceService(db);
  final syncService = SyncService(   invoiceService);

  final result = await syncService.handlePush(body);
  return Response.json(body: result);
}
