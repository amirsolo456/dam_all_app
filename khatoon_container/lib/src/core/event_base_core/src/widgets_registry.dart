// ignore_for_file: non_constant_identifier_names

import 'package:flutter/widgets.dart';

Map<String, Widget?> WidgetsRegistry = <String, Widget?>{};
// typedef MicroPageBuilder = Widget Function(RouteEvent event);
//
// class MicroAppWidgetRegistry {
//   static final Map<Type, MicroPageBuilder> _builders = {};
//
//   static void register<T extends RouteEvent>(
//       MicroPageBuilder builder,
//       ) {
//     _builders[T] = builder;
//   }
//
//   static Widget? resolve(RouteEvent event) {
//     final MicroPageBuilder? builder = _builders[event.runtimeType];
//     return builder?.call(event);
//   }
// }
