import 'package:json_annotation/json_annotation.dart';

part 'preferences.g.dart';

@JsonSerializable()
class Preferences {
  @JsonKey(defaultValue: 'fa')
  final String language;

  @JsonKey(defaultValue: 'IRT')
  final String currency;

  @JsonKey(defaultValue: 'light')
  final String theme;

  @JsonKey()
  final Map<String, dynamic> notificationSettings;

  @JsonKey()
  final List<String> favoriteCategories;

  @JsonKey(defaultValue: true)
  final bool autoLogin;

  @JsonKey(defaultValue: false)
  final bool biometricAuth;

  Preferences({
    this.language = 'fa',
    this.currency = 'IRT',
    this.theme = 'light',
    this.notificationSettings = const {},
    this.favoriteCategories = const [],
    this.autoLogin = true,
    this.biometricAuth = false,
  });

  factory Preferences.fromJson(Map<String, dynamic> json) =>
      _$PreferencesFromJson(json);

  Map<String, dynamic> toJson() => _$PreferencesToJson(this);
}
