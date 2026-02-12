// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrivacySettings _$PrivacySettingsFromJson(Map json) => PrivacySettings(
  showPurchaseHistory: json['showPurchaseHistory'] as bool? ?? true,
  shareWishlist: json['shareWishlist'] as bool? ?? false,
  receivePromotionalEmails: json['receivePromotionalEmails'] as bool? ?? true,
  receiveSmsNotifications: json['receiveSmsNotifications'] as bool? ?? true,
  isPhoneVerified: json['isPhoneVerified'] as bool? ?? false,
  isEmailVerified: json['isEmailVerified'] as bool? ?? false,
  shareLocation: json['shareLocation'] as bool? ?? false,
);

Map<String, dynamic> _$PrivacySettingsToJson(PrivacySettings instance) =>
    <String, dynamic>{
      'showPurchaseHistory': instance.showPurchaseHistory,
      'shareWishlist': instance.shareWishlist,
      'receivePromotionalEmails': instance.receivePromotionalEmails,
      'receiveSmsNotifications': instance.receiveSmsNotifications,
      'isPhoneVerified': instance.isPhoneVerified,
      'isEmailVerified': instance.isEmailVerified,
      'shareLocation': instance.shareLocation,
    };
