import 'package:flutter/material.dart';

class AnimatedPixelCounter extends StatefulWidget {
  const AnimatedPixelCounter({super.key});

  @override
  State<AnimatedPixelCounter> createState() => _AnimatedPixelCounterState();
}

class _AnimatedPixelCounterState extends State<AnimatedPixelCounter> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
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
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: decrement,
              child: Container(
                height: 20,
                width: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).colorScheme.primary),
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: const Center(
                  child: Icon(Icons.remove, size: 15),
                ),
              ),
            ),
            const SizedBox(height: 5),
            InkWell(
              onTap: increment,
              child: Container(
                height: 20,
                width: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).colorScheme.primary),
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: const Center(
                  child: Icon(Icons.add, size: 15),
                ),
              ),
            ),
          ],
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
