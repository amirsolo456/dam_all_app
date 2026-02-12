// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceInfo _$DeviceInfoFromJson(Map json) => DeviceInfo(
  deviceId: json['deviceId'] as String?,
  deviceModel: json['deviceModel'] as String?,
  os: json['os'] as String?,
  osVersion: json['osVersion'] as String?,
  appVersion: json['appVersion'] as String?,
  pushToken: json['pushToken'] as String?,
  lastSeen: const DateTimeNullableConverter().fromJson(
    json['lastSeen'] as String?,
  ),
);

Map<String, dynamic> _$DeviceInfoToJson(DeviceInfo instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'deviceModel': instance.deviceModel,
      'os': instance.os,
      'osVersion': instance.osVersion,
      'appVersion': instance.appVersion,
      'pushToken': instance.pushToken,
      'lastSeen': const DateTimeNullableConverter().toJson(instance.lastSeen),
    };
