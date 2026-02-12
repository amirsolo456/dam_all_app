// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityInfo _$ActivityInfoFromJson(Map json) => ActivityInfo(
  lastPurchaseDate: const DateTimeNullableConverter().fromJson(
    json['lastPurchaseDate'] as String?,
  ),
  lastLoginDate: const DateTimeNullableConverter().fromJson(
    json['lastLoginDate'] as String?,
  ),
  lastWishlistUpdate: const DateTimeNullableConverter().fromJson(
    json['lastWishlistUpdate'] as String?,
  ),
  lastCartUpdate: const DateTimeNullableConverter().fromJson(
    json['lastCartUpdate'] as String?,
  ),
  lastProfileUpdate: const DateTimeNullableConverter().fromJson(
    json['lastProfileUpdate'] as String?,
  ),
  lastLoyaltyUpdate: const DateTimeNullableConverter().fromJson(
    json['lastLoyaltyUpdate'] as String?,
  ),
  totalLogins: (json['totalLogins'] as num?)?.toInt() ?? 0,
  totalSessions: (json['totalSessions'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ActivityInfoToJson(ActivityInfo instance) =>
    <String, dynamic>{
      'lastPurchaseDate': const DateTimeNullableConverter().toJson(
        instance.lastPurchaseDate,
      ),
      'lastLoginDate': const DateTimeNullableConverter().toJson(
        instance.lastLoginDate,
      ),
      'lastWishlistUpdate': const DateTimeNullableConverter().toJson(
        instance.lastWishlistUpdate,
      ),
      'lastCartUpdate': const DateTimeNullableConverter().toJson(
        instance.lastCartUpdate,
      ),
      'lastProfileUpdate': const DateTimeNullableConverter().toJson(
        instance.lastProfileUpdate,
      ),
      'lastLoyaltyUpdate': const DateTimeNullableConverter().toJson(
        instance.lastLoyaltyUpdate,
      ),
      'totalLogins': instance.totalLogins,
      'totalSessions': instance.totalSessions,
    };
