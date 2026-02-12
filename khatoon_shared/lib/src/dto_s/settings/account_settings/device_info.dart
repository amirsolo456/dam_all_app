
import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_shared/index.dart';

part 'device_info.g.dart';
@JsonSerializable()
class DeviceInfo {
  final String? deviceId;
  final String? deviceModel;
  final String? os;
  final String? osVersion;
  final String? appVersion;
  final String? pushToken;

  @DateTimeNullableConverter()
  final DateTime? lastSeen;

  DeviceInfo({
    this.deviceId,
    this.deviceModel,
    this.os,
    this.osVersion,
    this.appVersion,
    this.pushToken,
    this.lastSeen,
  });

  factory DeviceInfo.fromJson(Map<String, dynamic> json) => _$DeviceInfoFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceInfoToJson(this);
}