import 'package:khatoon_container/src/core/event_base_core/services/routing/route_events.dart';

/// * Micro App Events
/// Register the micro app events here
/// so we provide them in [RouteEvents] to be fired from accross the micro apps.
/// The [initRouteListeners] method above will listen to the events listened here.
///

class UserLoggedOutEvent extends RouteEvent {}
class UserShownEvent extends RouteEvent {}
class UserLoggedInEvent extends RouteEvent {}

class UserForgotPasswordEvent extends RouteEvent {}

///
/// Exports the events in a class so we dont need to import
/// them from other micro apps. SignInEvents will be used by [RouteEvents]
///
class SignInEvents extends RouteEvent {
  RouteEvent userLoggedOutEvent = UserLoggedOutEvent();
  RouteEvent userLoggedInEvent = UserLoggedInEvent();
  RouteEvent userShownEvent = UserShownEvent();
  RouteEvent userForgotPasswordEvent = UserForgotPasswordEvent();
}
