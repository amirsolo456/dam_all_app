import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final NumberFormat formatter = NumberFormat('#,###');

class CustomRialLabel extends StatelessWidget {
  final double value;
  final Color? color;
  final String? bef;
  final String? past;
  final Function? clickable;

  const CustomRialLabel({
    super.key,
    required this.value,
    this.color,
    this.bef,
    this.past,
    this.clickable,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTabEvent,
      child: TextField(
        decoration: InputDecoration(
          labelStyle: .new(color: color ?? Colors.grey[900] ?? Colors.black54),
          labelText: '${bef ?? ''} ${formatter.format(value)} ${past ?? ''}',
        ),
      ),
    );
  }

  void onTabEvent() {
    if (clickable != null) {
      clickable!();
    }
  }
}
