import 'package:khatoon_container/src/features/user/data/models/user_model/user_model.dart';
import 'dart:async';

import 'package:khatoon_shared/index.dart';

// part 'user_local_data_source.g.dart';

class UserLocalDataSource implements IUserRepository<UserModel> {
  // static const String _boxName = 'usersBox';
  // static Box<UserModel> box = Hive.box<UserModel>(_boxName);

  @override
  Future<void> addUser(UserModel userModel) async {
    // await box.put(_boxName, userModel);
  }

  @override
  Future<List<UserModel>> getAllUsers() async {
    return <UserModel>[]; //box.values.toList();
  }

  @override
  Future<UserModel?> getUserById(int id) async {
    // return box.values.firstWhere(
    //   (UserModel user) => user.id == id,
    //   orElse: () => UserModel(0, '', '', '', 0, 0, UserRank.user, '', 10),
    // );
    return null;
  }

  @override
  Future<void> updateUser(UserModel userModel) async {
    // await box.put(userModel.id, userModel);
  }

  @override
  Future<void> deleteUser(int id) async {
    // await box.delete(id);
  }

  @override
  Future<void> clearAllUsers() async {
    // await box.clear();
  }

  Future<UserModel?> getUserByIdOptimized(int id) async {
    // final int index = box.values.toList().indexWhere(
    //   (UserModel user) => user.id == id,
    // );
    // return index != -1 ? box.getAt(index) : null;
    return null;
  }
}
