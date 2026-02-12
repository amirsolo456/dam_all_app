import 'package:flutter/material.dart';

class TaskProgressCard extends StatefulWidget {
  const TaskProgressCard({super.key});

  @override
  State<TaskProgressCard> createState() => _TaskProgressCardState();
}

class _TaskProgressCardState extends State<TaskProgressCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('Snapchat', style: Theme.of(context).textTheme.bodyMedium),
              const Spacer(),
              Icon(Icons.more_horiz, color: Theme.of(context).iconTheme.color),
            ],
          ),
          Text('TASK APP DESIGN',
              style: Theme.of(context).textTheme.titleLarge),
          Text('Lorem ipsum dolor sit amet,',
              style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 10),
          AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              return LinearProgressIndicator(
                value: _animation.value,
                backgroundColor: Theme.of(context).colorScheme.onSurface,
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(10),
              );
            },
          ),
          const SizedBox(height: 10),
          Row(
            children: <Widget>[
              Text('10/11/2024 - 14/11/2024',
                  style: Theme.of(context).textTheme.bodyMedium),
              const Spacer(),
              Text('82%', style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the animation controller
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Duration of the animation
    );
    _animation = Tween<double>(begin: 0, end: 0.82).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.forward(); // Start the animation
  }
}
