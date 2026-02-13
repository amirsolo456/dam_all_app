// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'micro_app.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MicroApp _$MicroAppFromJson(Map<String, dynamic> json) => MicroApp(
  bookmarked: json['bookmarked'] as bool,
  userId: (json['userId'] as num).toInt(),
  microAppsName: $enumDecode(_$MicroAppsNameEnumMap, json['microAppsName']),
);

Map<String, dynamic> _$MicroAppToJson(MicroApp instance) => <String, dynamic>{
  'userId': instance.userId,
  'microAppsName': _$MicroAppsNameEnumMap[instance.microAppsName]!,
  'bookmarked': instance.bookmarked,
};

const _$MicroAppsNameEnumMap = {
  MicroAppsName.purchases: 'purchases',
  MicroAppsName.settings: 'settings',
  MicroAppsName.signIn: 'signIn',
  MicroAppsName.profile: 'profile',
  MicroAppsName.notFound: 'notFound',
  MicroAppsName.reports: 'reports',
  MicroAppsName.shortCuts: 'shortCuts',
  MicroAppsName.menu: 'menu',
  MicroAppsName.animalProducts: 'animalProducts',
};
