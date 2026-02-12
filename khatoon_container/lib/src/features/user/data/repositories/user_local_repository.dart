// features/user/data/repositories/user_repository.dart
import 'dart:async';

import 'package:khatoon_container/src/features/user/data/data_sources/user_local_data_source.dart';
import 'package:khatoon_container/src/features/user/data/models/user_model/user_model.dart';
import 'package:khatoon_shared/index.dart';


class  UserLocalRepository implements IUserRepository<UserModel> {
  final UserLocalDataSource localDataSource;

  UserLocalRepository(this.localDataSource);

  @override
  FutureOr<void> addUser(UserModel user) async {
    final UserModel userModel = UserModel.fromEntity(user);
    await localDataSource.addUser(userModel);
  }

  @override
  FutureOr<void> updateUser(UserModel user) async {
    final UserModel userModel = UserModel.fromEntity(user);
    await localDataSource.updateUser(userModel);
  }

  @override
  FutureOr<List<UserModel>> getAllUsers() async {
    final List<UserModel> userModels = await localDataSource.getAllUsers();
    return userModels.toList();
  }

  @override
  FutureOr<UserModel?> getUserById(int id) async {
    final UserModel? userModel = await localDataSource.getUserById(id);
    return userModel;
  }

  @override
  FutureOr<void> deleteUser(int id) async {
    await localDataSource.deleteUser(id);
  }

  @override
  FutureOr<void> clearAllUsers() async {
    await localDataSource.clearAllUsers();
  }
}
