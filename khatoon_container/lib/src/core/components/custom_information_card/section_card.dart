import 'package:flutter/material.dart';

class SectionCard extends StatelessWidget {
  final Widget child;

  const SectionCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      borderOnForeground: false,
      semanticContainer: false,
      surfaceTintColor: Colors.grey,
      margin: const .fromLTRB(15, 0, 15, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(padding: const EdgeInsets.all(10), child: child),
    );
  }
}
