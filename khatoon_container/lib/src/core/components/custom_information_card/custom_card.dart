import 'package:flutter/material.dart';
import 'package:khatoon_container/src/app/theme/app_color.dart';
import 'package:khatoon_container/src/core/constants/extensions.dart';

class CustomCard extends StatelessWidget {
  final ShapeBorder? cardShape;
  final Widget? cardChild;

  const CustomCard({super.key, this.cardShape, this.cardChild});

  @override
  Widget build(BuildContext context) {
    final AppColors colors =context.colors;
    return Card(
      shape: cardShape,
      color: colors.main,

      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      child: cardChild,
    );
  }
}
