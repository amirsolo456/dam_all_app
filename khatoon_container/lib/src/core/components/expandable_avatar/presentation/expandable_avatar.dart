import 'package:flutter/material.dart';
import 'package:khatoon_container/src/core/components/drop_down/avatar_drop_down.dart';

class ExpandableAvatar extends StatefulWidget {
  const ExpandableAvatar({super.key});

  @override
  State<ExpandableAvatar> createState() => _ExpandableAvatarState();
}

class _ExpandableAvatarState extends State<ExpandableAvatar> {
  bool isDropdownOpen = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // bottom: false,
      child:
      DropdownWithAvatar(
        isOpen: isDropdownOpen,
        onStateChanged: (bool isOpen) {
          setState(() {
            isDropdownOpen = isOpen;
          });
        },
        // آواتار سفارشی
        avatar: const CircleAvatar(
          radius: 10,
        ),
      ),
      // Column(
      //    // mainAxisAlignment: MainAxisAlignment.center,
      //   children: <Widget>[
      //     DropdownWithAvatar(
      //       isOpen: isDropdownOpen,
      //       onStateChanged: (bool isOpen) {
      //         setState(() {
      //           isDropdownOpen = isOpen;
      //         });
      //       },
      //       // آواتار سفارشی
      //       avatar: const CircleAvatar(
      //         radius: 10,
      //       ),
      //     ),
      //
      //     // Text('Dropdown is: ${isDropdownOpen ? 'Open' : 'Closed'}'),
      //   ],
      // ),
    );
  }
}
