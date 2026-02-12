import 'package:khatoon_container/src/core/event_base_core/services/routing/route_events.dart';

/// * Micro App Events
/// Register the micro app events here
/// so we provide them in [RouteEvents] to be fired from accross the micro apps.
/// The [initRouteListeners] method above will listen to the events listened here.
///

class ProfileShownEvent extends RouteEvent {
  final String user;

  ProfileShownEvent(this.user);
}

class ProfileCreatedEvent extends RouteEvent {}

class ProfileAccountSettingsEvent extends RouteEvent {}

class OpenBottomSheetEvent extends RouteEvent {
  final String title;

  OpenBottomSheetEvent(this.title);
}

///
/// Exports the events in a class so we dont need to import
/// them from other micro apps. LoginEvents will be used by [RouteEvents]
///
class ProfileEvents extends RouteEvent {
  RouteEvent profileCreatedEvent() => ProfileCreatedEvent();
  RouteEvent profileShownEvent(String user) => ProfileShownEvent(user);
  RouteEvent profileAccountSettingsEvent() => ProfileAccountSettingsEvent();

  RouteEvent openBottomSheet(String title) => OpenBottomSheetEvent(title);
}
