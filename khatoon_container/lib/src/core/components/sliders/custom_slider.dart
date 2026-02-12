import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomNeumorphicSlider extends StatefulWidget {
  const CustomNeumorphicSlider({super.key});

  @override
  State<CustomNeumorphicSlider> createState() => _CustomNeumorphicSliderState();
}

class _CustomNeumorphicSliderState extends State<CustomNeumorphicSlider> {
  double age = 20;

  @override
  Widget build(BuildContext context) {
    return NeumorphicTheme(
      themeMode: ThemeMode.light,
      theme: const NeumorphicThemeData(
        intensity: 0.5,
      ),
      child: NeumorphicSlider(
        value: age,
        min: 18,
        max: 90,
        onChanged: (double value) {
          setState(() {
            age = value;
          });
        },
      ),
    );
  }
}