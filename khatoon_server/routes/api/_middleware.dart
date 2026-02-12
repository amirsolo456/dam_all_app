// routes/api/_middleware.dart
import 'package:dart_frog/dart_frog.dart';
import 'package:khatoon_server/src/services/users/user_repository.dart';

final _usersDataSource = UserRepository(  );

Middleware middleware = (handler) {
  return handler
      .use(requestLogger())
      .use(provider<UserRepository>((_) => _usersDataSource));

};
