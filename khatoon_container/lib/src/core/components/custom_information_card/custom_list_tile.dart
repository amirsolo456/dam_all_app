import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Widget? title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final bool selected;
  final bool enabled;
  final VoidCallback? onLongPress;

  const CustomListTile({
    super.key,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.selected = false,
    this.enabled = true,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      subtitle: subtitle,
      leading: leading,
      trailing: trailing,
      selected: selected,
      onLongPress: onLongPress,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      minVerticalPadding: 12,
      enabled: enabled,
      selectedTileColor: Colors.lightGreen,
      leadingAndTrailingTextStyle: .lerp(
        const TextStyle(fontWeight: .bold, color: Colors.black45),
        const TextStyle(fontWeight: .bold, color: Colors.black45),
        10,
      ),
      titleAlignment: ListTileTitleAlignment.top,
    );
  }
}
