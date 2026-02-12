import 'package:flutter/material.dart';

class AnimatedExpandedWidget extends StatefulWidget {
  const AnimatedExpandedWidget({super.key});

  @override
  State<AnimatedExpandedWidget> createState() => _AnimatedExpandedWidgetState();
}

class CartItem extends StatelessWidget {
  final bool isExpanded;
  final Function()? onTap;
  final bool isActive;

  const CartItem({
    super.key,
    required this.isExpanded,
    required this.onTap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    const Duration duration = Duration(milliseconds: 500);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: AnimatedContainer(
        duration: duration,
        height: MediaQuery.sizeOf(context).height * 0.09,
        width: 100,
        decoration: BoxDecoration(
          color: isActive
              ? Theme.of(context).colorScheme.primary.withAlpha(200)
              : !isExpanded
              ? Theme.of(context).colorScheme.surface
              : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(child: Text("20", style: TextStyle(fontSize: 16))),
      ),
    );
  }
}

class _AnimatedExpandedWidgetState extends State<AnimatedExpandedWidget> {
  bool isExpanded = false;
  bool hasCopied = false;
  bool hasCopied2 = false;
  int? activeIndex;

  @override
  Widget build(BuildContext context) {
    const Duration duration = Duration(milliseconds: 2500);
    return Center(
      child: AnimatedContainer(
        onEnd: () {
          setState(() => hasCopied = true);
        },
        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        height: 760 * (isExpanded ? 0.27 : 0.065),
        duration: duration,
        curve: Curves.elasticOut,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(15),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Row(
                    children: <Widget>[
                      Icon(Icons.fullscreen_rounded),
                      SizedBox(width: 5),
                      Text(
                        "Rounded Corners",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Transform.scale(
                    scale: 0.8,
                    child: Switch(
                      activeThumbColor: Theme.of(context).colorScheme.primary,
                      activeTrackColor: Theme.of(
                        context,
                      ).colorScheme.primaryContainer,
                      inactiveTrackColor: Theme.of(
                        context,
                      ).colorScheme.onSurface,
                      trackOutlineColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.disabled)) {
                            return Theme.of(context).colorScheme.onSurface;
                          }
                          return Theme.of(context).colorScheme.onSurface;
                        },
                      ),
                      thumbColor: WidgetStateProperty.resolveWith<Color>((
                        Set<WidgetState> states,
                      ) {
                        if (states.contains(WidgetState.disabled)) {
                          return Theme.of(context).colorScheme.primary;
                        }
                        return Theme.of(context).colorScheme.surface;
                      }),
                      value: isExpanded,
                      onChanged: (bool val) {
                        setState(() {
                          isExpanded = !isExpanded;
                          activeIndex = null;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CartItem(
                            isExpanded: isExpanded,
                            isActive: activeIndex == 0,
                            onTap: () => setState(() => activeIndex = 0),
                          ),
                          CartItem(
                            isExpanded: isExpanded,
                            isActive: activeIndex == 1,
                            onTap: () => setState(() => activeIndex = 1),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CartItem(
                            isExpanded: isExpanded,
                            isActive: activeIndex == 2,
                            onTap: () => setState(() => activeIndex = 2),
                          ),
                          CartItem(
                            isActive: activeIndex == 3,
                            isExpanded: isExpanded,
                            onTap: () => setState(() => activeIndex = 3),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // ignore: always_specify_types
                  TweenAnimationBuilder(
                    key: ValueKey<bool>(hasCopied),
                    curve: Curves.elasticOut,
                    tween: Tween<double>(
                      begin: hasCopied ? 1.0 : 1.2,
                      end: hasCopied ? 1.2 : 1.0,
                    ),
                    onEnd: () {
                      setState(() => hasCopied = false);
                      Future<void>.delayed(const Duration(seconds: 1), () {
                        setState(() => hasCopied2 = false);
                      });
                    },
                    duration: const Duration(milliseconds: 500),
                    builder:
                        (BuildContext context, double value, Widget? child) {
                          return Transform.scale(
                            scale: value,
                            child: CircleAvatar(
                              backgroundColor: const Color(0xFFFFFFFF),
                              radius: 26,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    hasCopied = true;
                                    hasCopied2 = true;
                                  });
                                },
                                child: AnimatedCrossFade(
                                  crossFadeState: !hasCopied2
                                      ? CrossFadeState.showFirst
                                      : CrossFadeState.showSecond,
                                  duration: const Duration(milliseconds: 200),
                                  firstChild: const Icon(Icons.link),
                                  secondChild: const Icon(Icons.check),
                                ),
                              ),
                            ),
                          );
                        },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
