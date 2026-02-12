import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final int maxLines;

  const CustomText(
      this.text, {
        super.key,
        this.style,
        this.maxLines = 1,
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.visible,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.start,
      softWrap: true,
      style: style ??
          TextStyle(
            fontSize: 12,
            fontStyle: .normal,
            locale:const Locale('fa'),
            fontFeatures: .empty(growable: true),
            color: Colors.white,
            fontFamily: 'Vazirani',
          ),
    );
  }
}
