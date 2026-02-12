import 'package:ant_design_flutter/ant_design_flutter.dart' as tooltip;
import 'package:flutter/material.dart';

class CustomToolTip extends StatelessWidget {
  const CustomToolTip({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return tooltip.Tooltip(
      label: 'ToolTip',
      child: Text(
        'Hover me for tooltip',
        style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onPrimary),
      ),
    );
  }
}
