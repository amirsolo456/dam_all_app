import 'dart:ui';

import 'package:flutter/material.dart';

class DropDownMenuFb1 extends StatelessWidget {
  final Color color;
  final Widget icon;
  final List<PopupMenuItem<dynamic>> items;
  final Alignment alignment;
  final ViewConstraints constraints;
  final Function(String)? onClick;

  const DropDownMenuFb1({
    this.color = Colors.white,
    this.icon = const Icon(Icons.more_vert),
    this.items = const <PopupMenuItem<Text>>[
      PopupMenuItem<Text>(child: Text('No Options!')),
    ],
    super.key,
    this.alignment = Alignment.center,

    this.constraints = const ViewConstraints(maxWidth: 250, maxHeight: 250),
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<dynamic>(
      position: PopupMenuPosition.under,
      surfaceTintColor: Colors.transparent,
      constraints: BoxConstraints.fromViewConstraints(constraints),
      style: ButtonStyle(
        iconAlignment: .end,
        iconSize: WidgetStateProperty.all(15),
        alignment: alignment,
        maximumSize: WidgetStateProperty.all(const Size(250, 70)),
      ),
      color: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.all(Radius.circular(13)),
        side: BorderSide(width: 0.3, color: Colors.black54),
      ),
      itemBuilder: (BuildContext context) {
        return items.map((PopupMenuItem<dynamic> item) {
          return PopupMenuItem<dynamic>(
            onTap: () => onItemClick(item),
            value: item.value,
            child: item.child,
          );
        }).toList();
      },
      onSelected: (dynamic item) => onItemClick(item),
      // onOpened: ,
      child: icon,
    );
  }

  dynamic onItemClick(dynamic value) {
    if (value is PopupMenuItem) {
      if (onClick != null) onClick?.call(value.value);
    }
  }
}
