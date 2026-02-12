import 'package:ant_design_flutter/ant_design_flutter.dart' hide Theme;
import 'package:flutter/material.dart';

class AnimatedRoundedTabBarFilled extends StatefulWidget {
  final List<TabPane> tabs;
  final double borderRadius;

  const AnimatedRoundedTabBarFilled({
    super.key,
    this.borderRadius = 30,
    required this.tabs,
  });

  @override
  State<AnimatedRoundedTabBarFilled> createState() =>
      _AnimatedRoundedTabBarFilledState();
}

class _AnimatedRoundedTabBarFilledState
    extends State<AnimatedRoundedTabBarFilled> {
  late List<bool> isHoverList = <bool>[false, false, false];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List<Widget>.generate(3, (int index) {
        return InkWell(
          onTap: () {
            setState(() {
              _currentIndex = index;
            });
          },
          onHover: (bool value) {
            setState(() {
              isHoverList[index] = value;
            });
          },
          child: AnimatedContainer(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeIn,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              color: _currentIndex == index || isHoverList[index]
                  ? Theme.of(context).colorScheme.primary
                  : null,
            ),
            child: Column(children: <Widget>[widget.tabs.first]),
          ),
        );
      }),
    );
  }
}
