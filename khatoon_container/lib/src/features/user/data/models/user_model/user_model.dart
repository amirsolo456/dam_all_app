import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_shared/index.dart';


part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  final int userModelId;

  final String userModelUsername;

  final String userModelPassword;

  final String userModelEmail;

  final int userModelLastLogin;

  final int userModelDataCreated;

  final UserRank userModelRank;

  final String userModelName; // non-nullable

  final int userModelAge; // non-nullable

  UserModel(
    this.userModelId,
    this.userModelUsername,
    this.userModelPassword,
    this.userModelEmail,
    this.userModelLastLogin,
    this.userModelDataCreated,
    this.userModelRank,
    this.userModelName,
    this.userModelAge,
  ) : super(
        name: userModelName,
        id: userModelId,
        age: userModelAge,
        dataCreated: userModelDataCreated,
        email: userModelEmail,
        lastLogin: userModelLastLogin,
        password: userModelPassword,
        rank: userModelRank,
        username: userModelUsername,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  // تبدیل از Entity
  factory UserModel.fromEntity(User entity) {
    return UserModel(
      entity.id,
      entity.username,
      entity.password,
      entity.email,
      entity.lastLogin,
      entity.dataCreated,
      entity.rank,
      entity.name,
      entity.age,
    );
  }

  User toEntity() {
    return User(
      id: id,
      username: username,
      password: password,
      email: email,
      lastLogin: lastLogin,
      dataCreated: dataCreated,
      rank: rank,
      name: name,
      age: age,
    );
  }
}
