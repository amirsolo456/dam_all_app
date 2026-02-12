import 'package:flutter/material.dart';
import 'package:khatoon_container/src/core/event_base_core/services/routing/generate_route.dart';
import 'package:khatoon_container/src/core/event_base_core/src/micro_app.dart';
import 'package:khatoon_container/src/core/event_base_core/src/micro_core_utils.dart';
import 'package:khatoon_container/src/core/event_base_core/src/widgets_registry.dart';


/// * Base App
///
/// Responsible for initializing the project and setting up the routing.
///
/// It's the only one to know all micro apps.
///
mixin  BaseApp {
  ///
  /// * Micro Apps
  ///
  /// A list of [MicroApp]. Here is where we declare all micro apps resolvers from the Base App
  ///
  List<MicroApp> get microApps;

  ///
  /// * Base Routes
  ///
  /// Here we can register routes that are not part of a micro app
  ///
  Map<String, WidgetBuilderArgs> get baseRoutes;

  final Map<String, WidgetBuilderArgs> routes = <String, WidgetBuilderArgs>{};

  ///
  /// * Initialise Routing
  ///
  /// Responsible for initialising the routes for each micro app resolver.
  ///
  /// It also initializes the event listeners. And register widgets experoted as micro front ends.
  ///
  void initialiseRouting() {
    if (baseRoutes.isNotEmpty) routes.addAll(baseRoutes);
    if (microApps.isNotEmpty && routes.isEmpty) {
      for (MicroApp microapp in microApps) {
        routes.addAll(microapp.routes);
        microapp.initEventListeners();
        microapp.injectionsRegister();
        if (microapp.microAppWidget() != null) {
          WidgetsRegistry[microapp.microAppName] = microapp.microAppWidget();
        }
      }
    }
  }

  ///
  /// * Generate Route
  ///
  /// Generate the Flutter routing, registering all micro apps routes
  ///
  Route<dynamic>? generateRoute(RouteSettings settings) {
    final String? routerName = settings.name;

    final WidgetBuilderArgs? navigateTo = routes[routerName];
    if (navigateTo == null) return null;

    for (MicroApp microapp in microApps) {
      for (String page in microapp.routes.keys) {
        if (settings.name == page) {
          return onGenerateRoute(
            widget: microapp.routes[page],
            navigateTo: navigateTo,
            settings: settings,
            arguments: settings.arguments,
            transitionType: microapp.transitionType,
          );
        }
      }
    }
    return null;
  }
}