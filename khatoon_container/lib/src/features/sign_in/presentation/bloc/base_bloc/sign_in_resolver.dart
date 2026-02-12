import 'package:khatoon_container/src/core/event_base_core/services/routing/routing.dart';
import 'package:khatoon_container/src/core/event_base_core/services/routing/routing_transitions.dart';
import 'package:khatoon_container/src/features/sign_in/presentation/sign_in_page.dart';
import 'package:khatoon_container/index.dart';

class SignInResolver implements MicroApp {
  @override
  String get microAppName => "/${MicroAppsName.signIn.name}";

  @override
  Map<String, WidgetBuilderArgs> get routes => <String, WidgetBuilderArgs>{
    microAppName: (BuildContext context, Object? args) => const SignInWidget(),
  };

  @override
  void initEventListeners() {
    // CustomEventBus.on<UserLoggedOutEvent>((event) {
    //   // we can use events to navigate as well.
    //   // Routing.pushNamed<UserLoggedOutEvent>(Routes.SignIn);
    //   if (kDebugMode) {
    //     print('LOGGED OUT');
    //   }
    // });
    // CustomEventBus.on<UserLoggedInEvent>((event) {
    //   Routing.pushNamed(Routes.purchases);
    // });
  }

  @override
  SignInEvents microAppEvents() => SignInEvents();

  @override
  Widget? microAppWidget() => null;

  @override
  void injectionsRegister() => Inject.initialize();

  @override
  TransitionType? get transitionType => TransitionType.fade;
}
