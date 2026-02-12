import 'package:flutter/material.dart';

class InProgressTaskCard extends StatefulWidget {
  const InProgressTaskCard({super.key});

  @override
  State<InProgressTaskCard> createState() => _InProgressTaskCardState();
}

class _InProgressTaskCardState extends State<InProgressTaskCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      height: 65,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 60,
            width: 60,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(5),
            //   image: DecorationImage(
            //     fit: BoxFit.cover,
            //     image: null,
            //   ),
            // ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Learn Web Development',
                  style: theme.textTheme.bodyMedium,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '24 Lessons',
                      style: theme.textTheme.bodySmall,
                    ),
                    const Spacer(),
                    Text(
                      '2Hr 12Min',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 10,
                        color: theme.colorScheme.error,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, Widget? child) {
                    return LinearProgressIndicator(
                      color: theme.colorScheme.primary,
                      value: _animation.value,
                      backgroundColor: theme.colorScheme.surface,
                    );
                  },
                ),
              ],
            ),
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
    _animation = Tween<double>(begin: 0, end: 0.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.forward(); // Start the animation
  }
}
