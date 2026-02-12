import 'package:dart_frog/dart_frog.dart';
import 'package:khatoon_server/src/services/users/user_repository.dart';

Handler middleware(Handler handler) {
  return handler.use(
    provider<UserRepository>(
      (_) => UserRepository(),
    ),
  );
}
// Middleware middleware = (Handler handler) {
//   return (RequestContext context) async {
//     final db = await DatabaseService();
//     await db.execute('SELECT * FROM invoices');
//     print('Request: ${context.request.uri}');
//     return handler(context);
//   };
// };
