import 'package:flutter/material.dart';
import 'package:khatoon_container/src/app/theme/app_color.dart';
import 'package:khatoon_container/src/core/base/common/domain/entities/action_buttons.dart';
import 'package:khatoon_container/src/core/constants/extensions.dart';
import 'package:khatoon_container/src/core/storage/data/db/application_service.dart';

final GlobalKey dropdownKey = GlobalKey();

class DropdownWithAvatar extends StatefulWidget {
  final bool isOpen;
  final void Function(bool)? onStateChanged;
  final Widget? avatar;

  const DropdownWithAvatar({
    super.key,
    this.isOpen = false,
    this.onStateChanged,
    this.avatar,
  });

  @override
  State<DropdownWithAvatar> createState() => _DropdownWithAvatarState();
}

class _DropdownWithAvatarState extends State<DropdownWithAvatar> {
  List<ActionButtons<dynamic>> options = ApplicationService.profileMenuData;
  String selectedValue = 'One';

  @override
  void didUpdateWidget(covariant DropdownWithAvatar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isOpen != oldWidget.isOpen) {
      if (widget.isOpen) {
        _showMenu();
      } else {
        _hideMenu();
      }
    }
  }

  void _showMenu() {
    final dynamic popupState = dropdownKey.currentState;
    if (popupState != null) {
      popupState.showButtonMenu();
      widget.onStateChanged?.call(true);
    }
  }

  void _hideMenu() {
    Navigator.of(context).pop();
    widget.onStateChanged?.call(false);
  }

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.colors;
    return Container(
      width: 200,
      height: 40,margin: const .only(left: 10),
      decoration: BoxDecoration(
        color:  colors.main,
        borderRadius: BorderRadius.circular(8),

      ),
      child: PopupMenuButton<String>(
        key: dropdownKey,
        offset: const Offset(0, 45),
        onSelected: (String value) {
          setState(() {
            selectedValue = value;
          });
          widget.onStateChanged?.call(false);
        },
        onCanceled: () {
          widget.onStateChanged?.call(false);
        },
        itemBuilder: (BuildContext context) {
          return options.map((ActionButtons<dynamic> option) {
            return PopupMenuItem<String>(
              value: option.title,
              onTap: option.action,
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: colors.primary,
                    child: Text(
                      option.title ?? '',
                      style:   TextStyle(fontSize: 10, color: colors.text),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(option.title ?? ''),
                ],
              ),
            );
          }).toList();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: ConstrainedBox(
            constraints: const .new(maxHeight: .minPositive),
            child: Row(
              children: <Widget>[
                // آواتار اصلی
                widget.avatar ??
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Text(
                        selectedValue[0],
                        style:   TextStyle(
                          fontSize: 14,
                          color: colors.text,
                        ),
                      ),
                    ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    selectedValue,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: colors.border,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
