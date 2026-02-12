import 'package:khatoon_container/src/core/event_base_core/services/routing/route_events.dart';

/// * Micro App Events
/// Register the micro app events here
/// so we provide them in [RouteEvents] to be fired from accross the micro apps.
/// The [initRouteListeners] method above will listen to the events listened here.
///

// class PageNotFoundEvents extends RouteEvent {
//   RouteEvent pageNotFoundEvent = PageNotFoundEvents( );
//   PageNotFoundEvents(this.pageNotFoundEvent);
// }

// ignore: camel_case_types
class F_ShortCutEvent extends RouteEvent {
  F_ShortCutEvent();
}

// ignore: camel_case_types
class F12_ShortCutEvent extends RouteEvent {
  F12_ShortCutEvent();
}

// ignore: camel_case_types
class N_ShortCutEvent extends RouteEvent {
  N_ShortCutEvent();
}

// ignore: camel_case_types
class BackSpace_ShortCutEvent extends RouteEvent {
  BackSpace_ShortCutEvent();
}

///
/// Exports the events in a class so we dont need to import
/// them from other micro apps. SignInEvents will be used by [RouteEvents]
///
class ShortCutsEvents extends RouteEvent {
  // ignore: non_constant_identifier_names
  RouteEvent f_ShortCutEvent() => F_ShortCutEvent();

  // ignore: non_constant_identifier_names
  RouteEvent f12_ShortCutEvent() => F12_ShortCutEvent();

  // ignore: non_constant_identifier_names
  RouteEvent n_ShortCutEvent() => N_ShortCutEvent();

  // ignore: non_constant_identifier_names
  RouteEvent backSpace_ShortCutEvent() => BackSpace_ShortCutEvent();
}
