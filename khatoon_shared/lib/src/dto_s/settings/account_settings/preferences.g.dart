// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Preferences _$PreferencesFromJson(Map json) => Preferences(
  language: json['language'] as String? ?? 'fa',
  currency: json['currency'] as String? ?? 'IRT',
  theme: json['theme'] as String? ?? 'light',
  notificationSettings:
      (json['notificationSettings'] as Map?)?.map(
        (k, e) => MapEntry(k as String, e),
      ) ??
      const {},
  favoriteCategories:
      (json['favoriteCategories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  autoLogin: json['autoLogin'] as bool? ?? true,
  biometricAuth: json['biometricAuth'] as bool? ?? false,
);

Map<String, dynamic> _$PreferencesToJson(Preferences instance) =>
    <String, dynamic>{
      'language': instance.language,
      'currency': instance.currency,
      'theme': instance.theme,
      'notificationSettings': instance.notificationSettings,
      'favoriteCategories': instance.favoriteCategories,
      'autoLogin': instance.autoLogin,
      'biometricAuth': instance.biometricAuth,
    };
