// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationSettings _$NotificationSettingsFromJson(Map json) =>
    NotificationSettings(
      orderNotifications: json['orderNotifications'] as bool? ?? true,
      inventoryAlerts: json['inventoryAlerts'] as bool? ?? true,
      newsletter: json['newsletter'] as bool? ?? true,
      promotionEmails: json['promotionEmails'] as bool? ?? true,
      smsNotifications: json['smsNotifications'] as bool? ?? true,
    );

Map<String, dynamic> _$NotificationSettingsToJson(
  NotificationSettings instance,
) => <String, dynamic>{
  'orderNotifications': instance.orderNotifications,
  'inventoryAlerts': instance.inventoryAlerts,
  'newsletter': instance.newsletter,
  'promotionEmails': instance.promotionEmails,
  'smsNotifications': instance.smsNotifications,
};
