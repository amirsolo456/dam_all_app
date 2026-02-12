import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomNeumorphicSwitch extends StatefulWidget {
  const CustomNeumorphicSwitch({super.key});

  @override
  State<CustomNeumorphicSwitch> createState() => _CustomNeumorphicSwitchState();
}

class _CustomNeumorphicSwitchState extends State<CustomNeumorphicSwitch> {
  bool isChecked = false;
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    return NeumorphicTheme(
      themeMode: ThemeMode.light,
      theme: NeumorphicThemeData(
        intensity: 0.5,
        baseColor: Theme.of(context).colorScheme.surface,
        accentColor: Theme.of(context).colorScheme.primary,
      ),
      child: NeumorphicSwitch(
        style: NeumorphicSwitchStyle(
          inactiveTrackColor: Theme.of(context).disabledColor,
          activeTrackColor: Theme.of(context).colorScheme.primary,
          thumbDepth: 10,
        ),
        value: isChecked,
        isEnabled: isEnabled,
        onChanged: (bool value) {
          setState(() {
            isChecked = value;
          });
        },
      ),
    );
  }
}
