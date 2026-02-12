import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

class DockingBar extends StatefulWidget {
  const DockingBar({super.key});

  @override
  State<DockingBar> createState() => _DockingBarState();
}

class _DockingBarState extends State<DockingBar> {
  int activeIndex = 0;

  List<IconData> icons = <IconData>[
    Icons.home,
    Icons.search,
    Icons.menu,
    Icons.notifications,
    Icons.person,
  ];

  Tween<double> tween = Tween<double>(begin: 1.0, end: 1.2);
  bool animationCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TweenAnimationBuilder<double>(
          key: ValueKey<int>(activeIndex),

          duration: Duration(milliseconds: animationCompleted ? 2000 : 200),
          tween: tween,
          curve: animationCompleted ? Curves.elasticOut : Curves.easeOut,
          onEnd: () {
            setState(() {
              animationCompleted = true;
              tween = Tween<double>(begin: 1.5, end: 1.0);
            });
          },
          builder: (BuildContext context, double value, Widget? child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List<Widget>.generate(icons.length, (int i) {
                return Transform(
                  alignment: Alignment.bottomCenter,
                  transform: Matrix4.identity()
                    ..scaleByVector3(
                      Vector3(
                        i == activeIndex ? value : 1.0, // X
                        i == activeIndex ? value : 1.0, // Y
                        1.0, // Z
                      ),
                    )
                    ..translateByVector3(
                      Vector3(
                        0.0,
                        i == activeIndex ? 80.0 * (1 - value) : 0.0,
                        0.0,
                      ),
                    ),
                  // 0.0, i == activeIndex ? 80.0 * (1 - value) : 0.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        animationCompleted = false;
                        tween = Tween<double>(begin: 1.0, end: 1.2);
                        activeIndex = i;
                      });
                    },
                    onHover: (bool pointer) {
                      setState(() {
                        animationCompleted = false;
                        tween = Tween<double>(begin: 1.0, end: 1.2);
                        activeIndex = i;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        icons[i],
                        size: 24, // Icon size
                        color: Theme.of(
                          context,
                        ).colorScheme.onPrimary, // Icon color
                      ),
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
