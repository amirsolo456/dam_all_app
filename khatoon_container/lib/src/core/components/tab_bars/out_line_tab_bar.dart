import 'package:flutter/material.dart';

class AnimatedRoundedTabBarOutlined extends StatefulWidget {
  final double borderRadius;
  const AnimatedRoundedTabBarOutlined({super.key, this.borderRadius = 30});

  @override
  State<AnimatedRoundedTabBarOutlined> createState() =>
      _AnimatedRoundedTabBarOutlinedState();
}

class _AnimatedRoundedTabBarOutlinedState
    extends State<AnimatedRoundedTabBarOutlined> {
  late List<bool> isHoverList = <bool>[false, false, false];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List<Widget>.generate(
        3,
            (int index) {
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
                border: _currentIndex == index || isHoverList[index]
                    ? Border.all(color: Theme.of(context).colorScheme.primary)
                    : null,
              ),
              child: Text(<String>['Home', 'Contact', 'About'][index],
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
          );
        },
      ),
    );
  }
}
