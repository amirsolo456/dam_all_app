import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';

class DemoPage extends StatelessWidget {
  final int page;

  const DemoPage({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[theme.colorScheme.primary, theme.colorScheme.secondary],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Page ${page + 1}',
              style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onPrimary),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Card(
                color: theme.colorScheme.surface,
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Welcome to Page ${page + 1}',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'This is a sample content for page ${page + 1}. You can customize this text and add more widgets to enhance the UI.',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface.withAlpha(700),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FlipPage extends StatelessWidget {
  const FlipPage({super.key});

  GlobalKey<PageFlipWidgetState> get controller =>
      GlobalKey<PageFlipWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageFlipWidget(
        key: controller,
        backgroundColor: Theme.of(context).colorScheme.surface,
        // isRightSwipe: true,
        lastPage: Container(
            color: Colors.white,
            child: const Center(child: Text('Last Page!'))),
        children: <Widget>[
          for (int i = 0; i < 10; i++) DemoPage(page: i),
        ],
      ),
    );
  }
}
