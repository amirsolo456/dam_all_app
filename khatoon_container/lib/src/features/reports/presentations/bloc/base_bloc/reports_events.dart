import 'package:khatoon_container/src/core/event_base_core/services/routing/route_events.dart';

/// Base class for all Settings route events

/// Delete account flow
class ReportsInitialEvents extends RouteEvent {
  ReportsInitialEvents();
}

///
/// Exported facade class
/// Used by RouteEvents to expose settings events
///
class ReportsEvents extends RouteEvent {
  RouteEvent reportsInitialEvents() => ReportsInitialEvents();
}
