import 'package:flutter/material.dart';

class AnimatedOutlinedCounter extends StatefulWidget {
  final double borderRadius;
  const AnimatedOutlinedCounter({super.key, this.borderRadius = 100});

  @override
  State<AnimatedOutlinedCounter> createState() =>
      _AnimatedOutlinedCounterState();
}

class _AnimatedOutlinedCounterState extends State<AnimatedOutlinedCounter> {
  bool isAddHovered = false;
  bool isRemoveHovered = false;
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onHover: (bool hover) {
            setState(() {
              isRemoveHovered = hover;
            });
          },
          onTap: decrement,
          child: Container(
            height: 20,
            width: 20,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Theme.of(context).colorScheme.primary),
              borderRadius: BorderRadius.circular(widget.borderRadius),
              color: isRemoveHovered
                  ? Theme.of(context).colorScheme.primary
                  : null,
            ),
            child: const Center(
              child: Icon(Icons.remove, size: 15),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 44,
          width: 84,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Text('$count', style: Theme.of(context).textTheme.bodyMedium),
        ),
        const SizedBox(width: 10),
        InkWell(
          onHover: (bool hover) {
            setState(() {
              isAddHovered = hover;
            });
          },
          onTap: increment,
          child: Container(
            height: 20,
            width: 20,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color:Theme.of(context).colorScheme.primary),
              borderRadius: BorderRadius.circular(widget.borderRadius),
              color: isAddHovered ? Theme.of(context).colorScheme.primary : null,
            ),
            child: const Center(
              child: Icon(Icons.add, size: 15),
            ),
          ),
        ),
      ],
    );
  }

  void decrement() {
    setState(() {
      if (count > 1) {
        count--;
      }
    });
  }

  void increment() {
    setState(() {
      count++;
    });
  }
}
