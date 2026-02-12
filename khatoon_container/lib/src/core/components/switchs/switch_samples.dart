import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

class AdvanceSwitchFlutter extends StatefulWidget {
  final double radius;
  final double thumbRadius;
  final Widget? activeChild;
  final Widget? inactiveChild;
  const AdvanceSwitchFlutter(
      {super.key,
        required this.radius,
        required this.thumbRadius,
        this.activeChild,
        this.inactiveChild});

  @override
  State<AdvanceSwitchFlutter> createState() => _AdvanceSwitchFlutterState();
}

class FlutterAdvanceSwitches extends StatelessWidget {
  const FlutterAdvanceSwitches({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AdvanceSwitchFlutter(
          radius: 30,
          thumbRadius: 10,
          activeChild: Icon(Icons.done, size: 15, color: Colors.black),
          inactiveChild: Icon(Icons.close, size: 15, color: Colors.black),
        ),
        SizedBox(height: 10),
        AdvanceSwitchFlutter(
          radius: 5,
          thumbRadius: 3,
          activeChild: Icon(Icons.done, size: 15, color: Colors.black),
          inactiveChild: Icon(Icons.close, size: 15, color: Colors.black),
        ),
        SizedBox(height: 10),
        AdvanceSwitchFlutter(
          radius: 30,
          thumbRadius: 10,
          activeChild: Icon(Icons.dark_mode, size: 15, color: Colors.black),
          inactiveChild: Icon(Icons.light_mode, size: 15, color: Colors.black),
        ),
        SizedBox(height: 10),
        AdvanceSwitchFlutter(
          radius: 5,
          thumbRadius: 3,
          activeChild: Icon(Icons.dark_mode, size: 15, color: Colors.black),
          inactiveChild: Icon(
            Icons.light_mode,
            size: 15,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class _AdvanceSwitchFlutterState extends State<AdvanceSwitchFlutter> {
  final ValueNotifier<bool> _controller00 = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return AdvancedSwitch(
      activeColor: Theme.of(context).colorScheme.primary,
      inactiveColor: Theme.of(context).colorScheme.surface,
      activeChild: const SizedBox(),
      inactiveChild: const SizedBox(),
      borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
      width: 80,
      height: 36,
      thumb: Container(
        margin: const EdgeInsets.all(5),
        height: 24,
        width: 24,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(widget.thumbRadius)),
        child: ValueListenableBuilder<bool>(
          valueListenable: _controller00,
          builder: (_, bool value, _) {
            return value ? widget.activeChild! : widget.inactiveChild!;
          },
        ),
      ),
      controller: _controller00,
    );
  }
}


class CustomAdvanceSwitch extends StatefulWidget {
  final double radius;
  final double thumbRadius;
  final Widget? activeChild;
  final Widget? inactiveChild;
  const CustomAdvanceSwitch(
      {super.key,
        this.radius = 40,
        this.thumbRadius = 100,
        this.activeChild,
        this.inactiveChild});

  @override
  State<CustomAdvanceSwitch> createState() => _CustomAdvanceSwitchState();
}

class CustomAdvanceSwitches extends StatelessWidget {
  const CustomAdvanceSwitches({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CustomAdvanceSwitch(),
        SizedBox(height: 10),
        CustomAdvanceSwitch(radius: 5, thumbRadius: 2),
        SizedBox(height: 10),
        CustomAdvanceSwitch(
          activeChild: Icon(Icons.done, size: 15),
          inactiveChild: Icon(Icons.close, size: 15),
        ),
        SizedBox(height: 10),
        CustomAdvanceSwitch(
          activeChild: Icon(Icons.dark_mode, size: 15),
          inactiveChild: Icon(Icons.light_mode, size: 15),
        ),
      ],
    );
  }
}

class _CustomAdvanceSwitchState extends State<CustomAdvanceSwitch> {
  final ValueNotifier<bool> _controller00 = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return AdvancedSwitch(
      activeColor: Theme.of(context).colorScheme.primary,
      inactiveColor: Theme.of(context).colorScheme.surface,
      activeChild: widget.activeChild ?? const Text('ON'),
      inactiveChild: widget.inactiveChild ?? const Text('OFF'),
      borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
      width: 80,
      height: 36,
      thumb: Container(
        margin: const EdgeInsets.all(5),
        height: 24,
        width: 24,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(widget.thumbRadius)),
      ),
      controller: _controller00,
    );
  }
}



