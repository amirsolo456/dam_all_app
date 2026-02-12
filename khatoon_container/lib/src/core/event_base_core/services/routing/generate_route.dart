import 'package:flutter/material.dart';

import 'package:khatoon_container/src/core/event_base_core/micro_core.dart';

///
/// * On Generate Route
/// This function  is resonsible for generating the routes navigation
/// based on [TransitionType].
/// Each [MicroApp] will define its transition type.
///
PageRoute<Widget> onGenerateRoute({
  required Widget Function(BuildContext, Object?)? widget,
  required Widget Function(BuildContext, Object?) navigateTo,
  required RouteSettings settings,
  TransitionType? transitionType,
  Object? arguments,
}) {
  switch (transitionType) {
    case TransitionType.fade:
      return PageRouteBuilder<Widget>(
        settings: settings,
        pageBuilder: (BuildContext context, _, _) => (widget!)(context, settings.arguments),
        transitionsBuilder: (_, Animation<double> a, _, Widget c) => FadeTransition(opacity: a, child: c),
      );
    case TransitionType.slideUp:
      return PageRouteBuilder<Widget>(
        settings: settings,
        pageBuilder: (BuildContext context, _, _) => (widget!)(context, settings.arguments),
        transitionsBuilder: (_, Animation<double> a, _, Widget c) => SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: const Offset(0.0, 0.0),
          ).animate(a),
          child: c,
        ),
      );
    case TransitionType.none:
      return PageRouteBuilder<Widget>(
        settings: settings,
        pageBuilder: (BuildContext context, _, _) => (widget!)(context, settings.arguments),
      );
    case TransitionType.defaultTransition:
      return MaterialPageRoute<Widget>(
        settings: RouteSettings(name: settings.name),
        builder: (BuildContext context) => navigateTo.call(context, settings.arguments),
      );
    default:
      return  MaterialPageRoute<Widget>(
        settings: RouteSettings(name: settings.name),
        builder: (BuildContext context) => navigateTo.call(context, settings.arguments),
      );
  }
}