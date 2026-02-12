import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:khatoon_container/src/core/components/drop_down/more_vet.dart';

class TitleTextDropDown extends StatelessWidget {
  final String? title;
  final List<PopupMenuItem<dynamic>> items;

  const TitleTextDropDown({super.key, this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 100,
      height: 30,
      child: DropDownMenuFb1(
        constraints: const ViewConstraints(
          // maxWidth: 100,
          maxHeight: 240,
          minWidth: 30,
          minHeight: 70,
        ),
        alignment: .centerRight,
        items: items,
        icon: Padding(
          padding: const .all(15),
          child: Row(
            spacing: 10,
            children: <Widget>[const Icon(Icons.more_vert), Text(title ?? '')],
          ),
        ),
      ),
    );
  }
}
