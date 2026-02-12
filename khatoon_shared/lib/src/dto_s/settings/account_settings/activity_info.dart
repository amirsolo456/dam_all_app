import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_shared/index.dart';

part 'activity_info.g.dart';
@JsonSerializable()
class ActivityInfo {
  @DateTimeNullableConverter()
  final DateTime? lastPurchaseDate;

  @DateTimeNullableConverter()
  final DateTime? lastLoginDate;

  @DateTimeNullableConverter()
  final DateTime? lastWishlistUpdate;

  @DateTimeNullableConverter()
  final DateTime? lastCartUpdate;

  @DateTimeNullableConverter()
  final DateTime? lastProfileUpdate;

  @DateTimeNullableConverter()
  final DateTime? lastLoyaltyUpdate;

  @JsonKey(defaultValue: 0)
  final int totalLogins;

  @JsonKey(defaultValue: 0)
  final int totalSessions;

  ActivityInfo({
    this.lastPurchaseDate,
    this.lastLoginDate,
    this.lastWishlistUpdate,
    this.lastCartUpdate,
    this.lastProfileUpdate,
    this.lastLoyaltyUpdate,
    this.totalLogins = 0,
    this.totalSessions = 0,
  });

  ActivityInfo copyWith({
    DateTime? lastPurchaseDate,
    DateTime? lastLoginDate,
    DateTime? lastWishlistUpdate,
    DateTime? lastCartUpdate,
    DateTime? lastProfileUpdate,
    DateTime? lastLoyaltyUpdate,
    int? totalLogins,
    int? totalSessions,
  }) {
    return ActivityInfo(
      lastPurchaseDate: lastPurchaseDate ?? this.lastPurchaseDate,
      lastLoginDate: lastLoginDate ?? this.lastLoginDate,
      lastWishlistUpdate: lastWishlistUpdate ?? this.lastWishlistUpdate,
      lastCartUpdate: lastCartUpdate ?? this.lastCartUpdate,
      lastProfileUpdate: lastProfileUpdate ?? this.lastProfileUpdate,
      lastLoyaltyUpdate: lastLoyaltyUpdate ?? this.lastLoyaltyUpdate,
      totalLogins: totalLogins ?? this.totalLogins,
      totalSessions: totalSessions ?? this.totalSessions,
    );
  }

  factory ActivityInfo.fromJson(Map<String, dynamic> json) =>
      _$ActivityInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityInfoToJson(this);
}
