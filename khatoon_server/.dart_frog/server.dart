// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, implicit_dynamic_list_literal

import 'dart:io';

import 'package:dart_frog/dart_frog.dart';


import '../routes/index.dart' as index;
import '../routes/sync/index.dart' as sync_index;
import '../routes/payments/index.dart' as payments_index;
import '../routes/parties/index.dart' as parties_index;
import '../routes/invoices/index.dart' as invoices_index;
import '../routes/employees/index.dart' as employees_index;
import '../routes/api/v1/users/index.dart' as api_v1_users_index;
import '../routes/api/v1/users/[id].dart' as api_v1_users_$id;
import '../routes/api/v1/payments/index.dart' as api_v1_payments_index;
import '../routes/api/v1/orders/index.dart' as api_v1_orders_index;
import '../routes/api/v1/invoices/index.dart' as api_v1_invoices_index;
import '../routes/api/v1/deliveries/index.dart' as api_v1_deliveries_index;
import '../routes/api/v1/auth/register.dart' as api_v1_auth_register;
import '../routes/api/v1/auth/profile.dart' as api_v1_auth_profile;
import '../routes/api/v1/auth/login.dart' as api_v1_auth_login;

import '../routes/_middleware.dart' as middleware;
import '../routes/api/_middleware.dart' as api_middleware;

void main() async {
  final address = InternetAddress.tryParse('') ?? InternetAddress.anyIPv6;
  final port = int.tryParse(Platform.environment['PORT'] ?? '8080') ?? 8080;
  hotReload(() => createServer(address, port));
}

Future<HttpServer> createServer(InternetAddress address, int port) {
  final handler = Cascade().add(buildRootHandler()).handler;
  return serve(handler, address, port);
}

Handler buildRootHandler() {
  final pipeline = const Pipeline().addMiddleware(middleware.middleware);
  final router = Router()
    ..mount('/api/v1/auth', (context) => buildApiV1AuthHandler()(context))
    ..mount('/api/v1/deliveries', (context) => buildApiV1DeliveriesHandler()(context))
    ..mount('/api/v1/invoices', (context) => buildApiV1InvoicesHandler()(context))
    ..mount('/api/v1/orders', (context) => buildApiV1OrdersHandler()(context))
    ..mount('/api/v1/payments', (context) => buildApiV1PaymentsHandler()(context))
    ..mount('/api/v1/users', (context) => buildApiV1UsersHandler()(context))
    ..mount('/employees', (context) => buildEmployeesHandler()(context))
    ..mount('/invoices', (context) => buildInvoicesHandler()(context))
    ..mount('/parties', (context) => buildPartiesHandler()(context))
    ..mount('/payments', (context) => buildPaymentsHandler()(context))
    ..mount('/sync', (context) => buildSyncHandler()(context))
    ..mount('/', (context) => buildHandler()(context));
  return pipeline.addHandler(router);
}

Handler buildApiV1AuthHandler() {
  final pipeline = const Pipeline().addMiddleware(api_middleware.middleware);
  final router = Router()
    ..all('/register', (context) => api_v1_auth_register.onRequest(context,))..all('/profile', (context) => api_v1_auth_profile.onRequest(context,))..all('/login', (context) => api_v1_auth_login.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildApiV1DeliveriesHandler() {
  final pipeline = const Pipeline().addMiddleware(api_middleware.middleware);
  final router = Router()
    ..all('/', (context) => api_v1_deliveries_index.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildApiV1InvoicesHandler() {
  final pipeline = const Pipeline().addMiddleware(api_middleware.middleware);
  final router = Router()
    ..all('/', (context) => api_v1_invoices_index.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildApiV1OrdersHandler() {
  final pipeline = const Pipeline().addMiddleware(api_middleware.middleware);
  final router = Router()
    ..all('/', (context) => api_v1_orders_index.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildApiV1PaymentsHandler() {
  final pipeline = const Pipeline().addMiddleware(api_middleware.middleware);
  final router = Router()
    ..all('/', (context) => api_v1_payments_index.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildApiV1UsersHandler() {
  final pipeline = const Pipeline().addMiddleware(api_middleware.middleware);
  final router = Router()
    ..all('/', (context) => api_v1_users_index.onRequest(context,))..all('/<id>', (context,id,) => api_v1_users_$id.onRequest(context,id,));
  return pipeline.addHandler(router);
}

Handler buildEmployeesHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/', (context) => employees_index.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildInvoicesHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/', (context) => invoices_index.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildPartiesHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/', (context) => parties_index.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildPaymentsHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/', (context) => payments_index.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildSyncHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/', (context) => sync_index.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/', (context) => index.onRequest(context,));
  return pipeline.addHandler(router);
}

