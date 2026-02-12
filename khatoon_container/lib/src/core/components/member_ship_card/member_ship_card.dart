import 'package:flutter/material.dart';

class MembershipCard extends StatelessWidget {
  const MembershipCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      height: 120,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: theme.cardColor, // Use theme's card color
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Membership',
            style: theme.textTheme.titleLarge?.copyWith(
              color: theme.colorScheme.onPrimary, // Use theme's onPrimary color
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '594',
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: theme.colorScheme.onPrimary, // Use theme's onPrimary color
                ),
              ),
              Text(
                'US\$496',
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: theme.colorScheme.onPrimary, // Use theme's onPrimary color
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Total members',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onPrimary.withAlpha(700), // Use theme's onPrimary color with opacity
                ),
              ),
              Text(
                'Per month',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onPrimary.withAlpha(700), // Use theme's onPrimary color with opacity
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
