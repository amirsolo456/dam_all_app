import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final Widget content;

  const CustomDialog({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
      ),
      elevation: 3,
      alignment: .center,
      backgroundColor: Colors.white70,
      constraints: const .expand(width: 300, height: 445),
      insetAnimationDuration: const Duration(milliseconds: 500),
      insetPadding: const EdgeInsets.all(5),
      child: content,
    );
  }
}
