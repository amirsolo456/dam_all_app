import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:khatoon_container/src/core/constants/extensions.dart';

class  SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  State<SettingsWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Text(context.l10n.settings_settings),
    );
  }
}
