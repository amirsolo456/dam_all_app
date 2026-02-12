 import 'package:khatoon_container/src/features/user/data/models/user_model/user_model.dart';
import 'package:khatoon_container/src/features/user/data/repositories/user_remote_repository.dart';

class GetUsersUseCase {
  final  UserRemoteRepository repository;

  GetUsersUseCase(this.repository);

  Future<List<UserModel>> call() async {
    return <UserModel>[];//await repository.getAllUsers();
  }
}

class SaveUserUseCase {
  final UserRemoteRepository repository;

  SaveUserUseCase(this.repository);

  Future<void> call(UserModel user) async {
    // return await repository.saveUser(user);
  }
}