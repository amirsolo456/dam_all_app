
import 'package:khatoon_container/src/core/event_base_core/micro_core.dart';
import 'package:khatoon_container/src/features/app_shortcuts/data/respositories/shortcuts_repository.dart';
import 'package:khatoon_container/src/features/app_shortcuts/presentation/bloc/base_bloc/short_cuts_inject.dart';
import 'package:khatoon_container/src/features/app_shortcuts/presentation/short_cuts_widget.dart';
import 'package:khatoon_container/index.dart';

typedef ArgsResolver = Object Function(Map<String, dynamic> params);

class ShortCutsResolver implements MicroApp {
  static final Map<String, ArgsResolver> _resolvers = <String, ArgsResolver>{
    MicroAppsName.purchases.persianName: (Map<String, dynamic> params) =>  <dynamic>[],
    MicroAppsName.profile.persianName: (Map<String, dynamic> params) => <dynamic>[],
  };

  @override
  Map<String, WidgetBuilderArgs> get routes => <String, WidgetBuilderArgs>{
    microAppName: (BuildContext context, Object? args) =>
        ShortCutsWidget(sl<ShortcutService>()),
  };

  @override
  void initEventListeners() {
    CustomEventBus.on<F_ShortCutEvent>((F_ShortCutEvent event) {
      sl<AppNotifier>().emit(RouteEvents.purchaseEvents.purchaseUpdateEvent);
    });
    CustomEventBus.on<F12_ShortCutEvent>((F12_ShortCutEvent event) {
      sl<AppNotifier>().emit(
        RouteEvents.purchaseEvents.purchaseShownEvent('Sown'),
      );
    });
    CustomEventBus.on<N_ShortCutEvent>((N_ShortCutEvent event) {
      sl<AppNotifier>().emit(RouteEvents.purchaseEvents.purchaseCreateNewEvent);
    });
    CustomEventBus.on<BackSpace_ShortCutEvent>((BackSpace_ShortCutEvent event) {
      Routing.back();
    });
  }

  @override
  void injectionsRegister() => Inject.initialize();

  @override
  ShortCutsEvents microAppEvents() => ShortCutsEvents();

  @override
  String get microAppName => '/${MicroAppsName.shortCuts.name}';

  @override
  Widget? microAppWidget() => null;

  @override
  TransitionType? get transitionType => TransitionType.fade;

  static Object? resolve(String microApp, Map<String, dynamic> params) {
    final ArgsResolver? resolver = _resolvers[microApp];
    if (resolver == null) return params; // fallback
    return resolver(params);
  }
}
