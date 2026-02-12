import 'package:khatoon_container/src/core/event_base_core/services/routing/route_events.dart' show RouteEvent;
import 'package:event_bus/event_bus.dart';
class CustomEventBus {
  CustomEventBus._internal();
  static final CustomEventBus _singleton = CustomEventBus._internal();
  factory CustomEventBus() => _singleton;

  final EventBus _bus = EventBus();

  static EventBus get bus => _singleton._bus;

  static void emit(RouteEvent event) {
    _singleton._bus.fire(event);
  }

  ///
  /// Listen to the fired event and execute a function
  ///
  static void on<T>(Function f) {
    _singleton._bus.on<T>().listen((T event) {
      f(event);
    });
  }
}