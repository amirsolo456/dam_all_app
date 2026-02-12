// routes/debug/connection.dart
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:khatoon_server/src/db/database.dart';

Future<Response> onRequest(RequestContext context) async {
  final db = DatabaseService();
  final products = await db.execute( 'SELECT * FROM invoices');
    // page: int.tryParse(context.request.uri.queryParameters['page'] ?? '0'),
    // limit:
    // int.tryParse(context.request.uri.queryParameters['limit'] ?? '2'),
    // search: context.request.uri.queryParameters['search'],

  return Response.json(
    body: {
      'message': 'Products fetched successfully',
      'status': HttpStatus.ok,
      'products': products,
    },
  );
  return Response.json(
      body: (await db
          .executeIRes ('SELECT * FROM invoices' ))
          .toString(),
      );
}
