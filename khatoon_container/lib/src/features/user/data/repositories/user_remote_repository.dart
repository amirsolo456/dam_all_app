import 'dart:async';

import 'package:khatoon_container/src/features/user/data/data_sources/user_remote_datasource.dart';

import 'package:khatoon_container/src/features/user/data/models/user_model/user_model.dart';
import 'package:khatoon_shared/index.dart';


class UserRemoteRepository implements IUserRepository<UserModel> {
  final UserRemoteDataSource userRemoteDataSource;

  UserRemoteRepository(this.userRemoteDataSource);

  @override
  FutureOr<void> addUser(UserModel userModel) {
    // TODO: implement addUser
    throw UnimplementedError();
  }

  @override
  FutureOr<void> clearAllUsers() {
    // TODO: implement clearAllUsers
    throw UnimplementedError();
  }

  @override
  FutureOr<void> deleteUser(int id) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  FutureOr<List<UserModel>> getAllUsers() {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }

  @override
  FutureOr<UserModel?> getUserById(int id) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  @override
  FutureOr<void> updateUser(User userModel) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
