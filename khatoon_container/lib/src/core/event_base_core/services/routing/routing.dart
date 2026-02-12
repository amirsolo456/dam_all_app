import 'package:flutter/material.dart';

import 'package:khatoon_container/src/core/event_base_core/micro_core.dart';

export 'routing_transitions.dart';

abstract class Routing {
  /// Push Named Route
  static Future<Object?>? pushNamed(Routes route, {RouteEvent? arguments}) {
    return navigatorKey.currentState?.pushNamed(route.value, arguments: arguments);
  }

  /// Back
  static void back() {
    final bool canPop = navigatorKey.currentState != null && navigatorKey.currentState!.canPop();

    if (canPop) {
      return navigatorKey.currentState?.pop();
    }
  }

  /// Push With Custom Transition
  static Future<dynamic>? pushCustom(
      Widget page, {
        TransitionType transitionType = TransitionType.defaultTransition,
      }) {
    return navigatorKey.currentState?.push(
      Transitions<TransitionType>(
        transitionType: transitionType,
        widget: page,
      ),
    );
  }

  static Future<Object?>? offAllNamed(
      Routes route, {
        bool Function(Route<dynamic>)? predicate,
        dynamic arguments,
      }) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
      route.value,
      predicate ?? (_) => false,
      arguments: arguments,
    );
  }

  static String? get current {
    String? currentPath;
    navigatorKey.currentState?.popUntil((Route<dynamic> route) {
      currentPath = route.settings.name;
      return true;
    });

    return currentPath;
  }
// Add more routing type here if necessary
}