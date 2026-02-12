import 'package:flutter/material.dart';
import 'package:khatoon_container/src/app/theme/app_color.dart';
import 'package:khatoon_container/src/core/constants/extensions.dart';
class _ToolbarButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ToolbarButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors =context.colors;
    return InkWell(
      borderRadius: BorderRadius.circular(6),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Row(
          children: <Widget>[
            Icon(icon, size: 18, color: colors.border),
            const SizedBox(width: 4),
            Text(label, style:   TextStyle(color: colors.text)),
          ],
        ),
      ),
    );
  }
}
class GridToolbar extends StatelessWidget {
  final VoidCallback onAdd;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const GridToolbar({
    super.key,
    required this.onAdd,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: <Widget>[
          _ToolbarButton(icon: Icons.add, label: 'Add', onTap: onAdd),
          const SizedBox(width: 8),
          _ToolbarButton(icon: Icons.delete, label: 'Delete', onTap: onDelete),
          const SizedBox(width: 8),
          _ToolbarButton(icon: Icons.edit, label: 'Edit', onTap: onEdit),
        ],
      ),
    );
  }
}