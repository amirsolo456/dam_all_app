// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  (json['userModelId'] as num).toInt(),
  json['userModelUsername'] as String,
  json['userModelPassword'] as String,
  json['userModelEmail'] as String,
  (json['userModelLastLogin'] as num).toInt(),
  (json['userModelDataCreated'] as num).toInt(),
  $enumDecode(_$UserRankEnumMap, json['userModelRank']),
  json['userModelName'] as String,
  (json['userModelAge'] as num).toInt(),
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'userModelId': instance.userModelId,
  'userModelUsername': instance.userModelUsername,
  'userModelPassword': instance.userModelPassword,
  'userModelEmail': instance.userModelEmail,
  'userModelLastLogin': instance.userModelLastLogin,
  'userModelDataCreated': instance.userModelDataCreated,
  'userModelRank': _$UserRankEnumMap[instance.userModelRank]!,
  'userModelName': instance.userModelName,
  'userModelAge': instance.userModelAge,
};

const _$UserRankEnumMap = {
  UserRank.accountant: 'accountant',
  UserRank.support: 'support',
  UserRank.analyst: 'analyst',
  UserRank.developer: 'developer',
  UserRank.assistant: 'assistant',
  UserRank.user: 'user',
  UserRank.viewer: 'viewer',
};
