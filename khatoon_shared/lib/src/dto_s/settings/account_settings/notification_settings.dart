import 'package:json_annotation/json_annotation.dart';
part 'notification_settings.g.dart';


@JsonSerializable()
class NotificationSettings {
  @JsonKey(defaultValue: true)
  final bool orderNotifications;

  @JsonKey(defaultValue: true)
  final bool inventoryAlerts;

  @JsonKey(defaultValue: true)
  final bool newsletter;

  @JsonKey(defaultValue: true)
  final bool promotionEmails;

  @JsonKey(defaultValue: true)
  final bool smsNotifications;

  NotificationSettings({
    this.orderNotifications = true,
    this.inventoryAlerts = true,
    this.newsletter = true,
    this.promotionEmails = true,
    this.smsNotifications = true,
  });

  factory NotificationSettings.fromJson(Map<String, dynamic> json) => _$NotificationSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationSettingsToJson(this);
}