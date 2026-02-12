import 'package:khatoon_container/src/core/event_base_core/services/routing/route_events.dart';

/// Base class for all Settings route events


/// Open main settings page
class SettingsShownEvent extends RouteEvent {}

/// Open profile settings
class SettingsOpenProfileEvent extends RouteEvent {
  final String userId;
  SettingsOpenProfileEvent(this.userId);
}

/// Open security settings
class SettingsOpenSecurityEvent extends RouteEvent {}

/// Open notification settings
class SettingsOpenNotificationEvent extends RouteEvent {
  final bool fromOnboarding;
  SettingsOpenNotificationEvent({this.fromOnboarding = false});
}

/// Change password flow
class SettingsChangePasswordEvent extends RouteEvent {
  final String email;
  SettingsChangePasswordEvent(this.email);
}

/// User logout from settings
class SettingsLogoutFromSettingsEvent extends RouteEvent {}

/// Delete account flow
class SettingsDeleteAccountEvent extends RouteEvent {
  final String userId;
  SettingsDeleteAccountEvent(this.userId);
}

///
/// Exported facade class
/// Used by RouteEvents to expose settings events
///
class SettingsEvents extends RouteEvent {
  RouteEvent openSettings(String userId) => SettingsOpenProfileEvent(userId);

  RouteEvent openProfile(String userId) =>
      SettingsOpenProfileEvent(userId);

  RouteEvent openSecurity() => SettingsOpenSecurityEvent();

  RouteEvent openNotifications({bool fromOnboarding = false}) =>
      SettingsOpenNotificationEvent(fromOnboarding: fromOnboarding);

  RouteEvent changePassword(String email) =>
      SettingsChangePasswordEvent(email);

  RouteEvent logout() => SettingsLogoutFromSettingsEvent();

  RouteEvent deleteAccount(String userId) =>
      SettingsDeleteAccountEvent(userId);
}
