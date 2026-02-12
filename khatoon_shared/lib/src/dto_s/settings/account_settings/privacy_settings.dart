// buyer_related.dart
import 'package:json_annotation/json_annotation.dart';

part 'privacy_settings.g.dart';

@JsonSerializable()
class PrivacySettings {
  @JsonKey(defaultValue: true)
  final bool showPurchaseHistory;

  @JsonKey(defaultValue: false)
  final bool shareWishlist;

  @JsonKey(defaultValue: true)
  final bool receivePromotionalEmails;

  @JsonKey(defaultValue: true)
  final bool receiveSmsNotifications;

  @JsonKey(defaultValue: false)
  final bool isPhoneVerified;

  @JsonKey(defaultValue: false)
  final bool isEmailVerified;

  @JsonKey(defaultValue: false)
  final bool shareLocation;

  PrivacySettings({
    this.showPurchaseHistory = true,
    this.shareWishlist = false,
    this.receivePromotionalEmails = true,
    this.receiveSmsNotifications = true,
    this.isPhoneVerified = false,
    this.isEmailVerified = false,
    this.shareLocation = false,
  });

  factory PrivacySettings.fromJson(Map<String, dynamic> json) =>
      _$PrivacySettingsFromJson(json);

  Map<String, dynamic> toJson() => _$PrivacySettingsToJson(this);
}
