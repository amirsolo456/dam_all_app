import 'package:flutter/material.dart';

class FittedBoxTextWidget extends StatelessWidget {
  const FittedBoxTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).colorScheme.secondary),
        child: FittedBox(
          child: Text(
            'Will automatically adjust the fontSize\nof Text according to its parent width',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              letterSpacing: .5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
