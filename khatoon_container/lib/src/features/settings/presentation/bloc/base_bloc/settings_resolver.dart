
import 'package:khatoon_container/src/core/event_base_core/services/routing/routing_transitions.dart';
import 'package:khatoon_container/src/features/settings/presentation/bloc/base_bloc/settings_inject.dart';
import 'package:khatoon_container/src/features/settings/presentation/widgets/settings_widget.dart';
import 'package:khatoon_container/index.dart';

class SettingsResolver implements MicroApp {
  @override
  String get microAppName => "/${MicroAppsName.settings.name}";

  @override
  Map<String, WidgetBuilderArgs> get routes => <String, WidgetBuilderArgs>{
    microAppName: (BuildContext context, Object? args) =>
        const SettingsWidget(),
  };

  @override
  void initEventListeners() {
    CustomEventBus.on<SettingsOpenProfileEvent>(
      (SettingsOpenProfileEvent event) {},
    );
    CustomEventBus.on<SettingsOpenProfileEvent>(
      (SettingsOpenProfileEvent event) {},
    );
    CustomEventBus.on<SettingsOpenSecurityEvent>(
      (SettingsOpenSecurityEvent event) {},
    );
    CustomEventBus.on<SettingsChangePasswordEvent>(
      (SettingsChangePasswordEvent event) {},
    );
    CustomEventBus.on<SettingsOpenNotificationEvent>(
      (SettingsOpenNotificationEvent event) {},
    );
    CustomEventBus.on<SettingsLogoutFromSettingsEvent>(
      (SettingsLogoutFromSettingsEvent event) {},
    );
    CustomEventBus.on<SettingsDeleteAccountEvent>(
      (SettingsDeleteAccountEvent event) {},
    );
  }

  @override
  SettingsEvents microAppEvents() => SettingsEvents();

  @override
  Widget? microAppWidget() => null;

  @override
  void injectionsRegister() => Inject.initialize();

  @override
  TransitionType? get transitionType => TransitionType.fade;
}
