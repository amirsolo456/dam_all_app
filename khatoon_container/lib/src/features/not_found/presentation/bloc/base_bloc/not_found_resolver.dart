import 'package:khatoon_container/src/core/event_base_core/services/routing/routing_transitions.dart';
import 'package:khatoon_container/src/features/not_found/presentation/bloc/base_bloc/not_found_events.dart';
import 'package:khatoon_container/src/features/not_found/presentation/bloc/base_bloc/not_found_inject.dart';
import 'package:khatoon_container/src/features/not_found/presentation/not_found_page.dart';
import 'package:khatoon_container/index.dart';

class NotFoundResolver implements MicroApp {
  @override
  String get microAppName => "/${MicroAppsName.notFound.name}";

  @override
  Map<String, WidgetBuilderArgs> get routes => <String, WidgetBuilderArgs>{
    microAppName: (BuildContext context, Object? args) => const NotFoundPage(),
  };

  @override
  void initEventListeners() {
    // CustomEventBus.on<PageNotFoundEvent>((event) {
    //   // we can use events to navigate as well.
    //   // Routing.pushNamed<UserLoggedOutEvent>(Routes.SignIn);
    //   if (kDebugMode) {
    //     print('LOGGED OUT');
    //   }
    // });
    // CustomEventBus.on<ShortKeyNotFoundEvent>((event) {
    //   // we can use events to navigate as well.
    //   // Routing.pushNamed<UserLoggedOutEvent>(Routes.SignIn);
    //   if (kDebugMode) {
    //     print('LOGGED OUT');
    //   }
    // });
  }

  @override
  void injectionsRegister() => Inject.initialize();

  @override
  NotFoundEvents microAppEvents() => NotFoundEvents();

  @override
  Widget? microAppWidget() => null;

  @override
  TransitionType? get transitionType => TransitionType.fade;
}
