import 'package:flutter/material.dart';
import 'package:khatoon_container/src/core/components/custom_information_card/custom_text.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Icon? icon;
  final Color? backgroundColor;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.icon,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Colors.green[600],
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ?icon,
          if (icon != null) const SizedBox(width: 8),
          CustomText(title),
        ],
      ),
    );
  }
}
