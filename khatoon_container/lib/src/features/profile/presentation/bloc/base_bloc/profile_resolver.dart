
import 'package:khatoon_container/src/core/event_base_core/services/routing/routing.dart';
import 'package:khatoon_container/src/features/profile/presentation/bloc/base_bloc/profile_inject.dart';
import 'package:khatoon_container/src/features/profile/presentation/widgets/profile_account_settings.dart';
import 'package:khatoon_container/index.dart';

class ProfileResolver implements MicroApp {
  @override
  String get microAppName => "/${MicroAppsName.profile.name}";

  @override
  Map<String, WidgetBuilderArgs> get routes => <String, WidgetBuilderArgs>{
    microAppName: (BuildContext context, Object? args) =>
        ProfileAccountSettings(args: (args is ProfileEvents ? args : null)),
  };

  @override
  void initEventListeners() {}

  @override
  ProfileEvents microAppEvents() => ProfileEvents();

  @override
  Widget? microAppWidget() => null;

  @override
  void injectionsRegister() => Inject.initialize();

  @override
  TransitionType? get transitionType => TransitionType.fade;
}
