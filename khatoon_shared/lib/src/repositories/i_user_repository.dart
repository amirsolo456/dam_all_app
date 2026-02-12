import 'dart:async';
import 'package:khatoon_shared/index.dart';


abstract class IUserRepository<T extends User> {

  FutureOr<void> addUser(T user);
  FutureOr<List<T>> getAllUsers();
  FutureOr<T?> getUserById(int id);
  FutureOr<void> updateUser(T user);
  FutureOr<void> deleteUser(int id);
  FutureOr<void> clearAllUsers();
}