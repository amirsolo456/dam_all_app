import 'package:flutter/material.dart';
import 'package:khatoon_container/src/core/event_base_core/micro_core.dart';
import 'package:khatoon_container/src/features/reports/presentations/bloc/base_bloc/reports_events.dart';
import 'package:khatoon_container/src/features/reports/presentations/reports_page.dart';
import 'package:khatoon_container/src/features/reports/presentations/bloc/base_bloc/reports_inject.dart';

class ReportsResolver implements MicroApp {

  @override
  String get microAppName => "/${MicroAppsName.reports.name}";

  @override
  Map<String, WidgetBuilderArgs> get routes => <String, WidgetBuilderArgs>{
    microAppName: (BuildContext context, Object? args) => const ReportsPage(),
  };

  @override
  void initEventListeners() {}

  @override
  void injectionsRegister() => Inject.initialize();

  @override
  ReportsEvents microAppEvents() => ReportsEvents();

  @override
  Widget? microAppWidget() => null;

  @override
  TransitionType? get transitionType => TransitionType.fade;
}
