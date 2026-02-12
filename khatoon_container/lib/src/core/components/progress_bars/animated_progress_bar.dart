import 'package:flutter/material.dart';

class AnimatedProgressBar extends StatefulWidget {
  final bool isBorder;
  final bool isFilled;
  const AnimatedProgressBar(
      {super.key, this.isBorder = false, this.isFilled = false});

  @override
  State<AnimatedProgressBar> createState() => _AnimatedProgressBarState();
}

class _AnimatedProgressBarState extends State<AnimatedProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Duration duration = const Duration(seconds: 2);

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Container(
      height: 20,
      width: MediaQuery.sizeOf(context).width,
      padding: widget.isFilled ? EdgeInsets.zero : const EdgeInsets.all(3),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.black,
        border: widget.isBorder
            ? Border.all(
          color: Theme.of(context).colorScheme.primary,
        )
            : null,
      ),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          return AnimatedContainer(
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 20000),
            width: MediaQuery.of(context).size.width * _controller.value,
            height: 20,
            color: Theme.of(context).colorScheme.primary,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: duration,
    );
  }
}
