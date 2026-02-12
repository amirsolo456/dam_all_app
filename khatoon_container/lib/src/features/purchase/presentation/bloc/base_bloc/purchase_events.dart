import 'package:khatoon_container/src/core/event_base_core/services/routing/route_events.dart';

/// * Micro App Events
/// Register the micro app events here
/// so we provide them in [RouteEvents] to be fired from accross the micro apps.
/// The [initRouteListeners] method above will listen to the events listened here.
///

class PurchaseCreateNewEvent extends RouteEvent {}

class PurchaseUpdateEvent extends RouteEvent {}
class PurchaseDeleteEvent extends RouteEvent {}
class PurchaseShownEvent extends RouteEvent {
  final String value;
    PurchaseShownEvent(this.value);
}

///
/// Exports the events in a class so we dont need to import
/// them from other micro apps. SignInEvents will be used by [RouteEvents]
///
class PurchaseCustomEvents extends RouteEvent {
  RouteEvent purchaseCreateNewEvent = PurchaseCreateNewEvent();
  RouteEvent purchaseUpdateEvent = PurchaseUpdateEvent();
  RouteEvent purchaseDeleteEvent = PurchaseDeleteEvent();
  RouteEvent purchaseShownEvent(String value) => PurchaseShownEvent(value);

}
