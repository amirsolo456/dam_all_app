// import 'package:ant_design_flutter/ant_design_flutter.dart'
//     hide Theme,  Colors;
import 'package:fan_floating_menu/fan_floating_menu.dart';
import 'package:flutter/material.dart';
import 'package:khatoon_container/src/core/base/common/domain/entities/action_buttons.dart';
import 'package:khatoon_container/src/core/components/custom_information_card/custom_text.dart';

class DynamicAddNewButton extends StatefulWidget {
  final List<ActionButtons<dynamic>> buttons;

  const DynamicAddNewButton({super.key, required this.buttons});

  @override
  State<DynamicAddNewButton> createState() => _DynamicAddNewButton();
}

class _DynamicAddNewButton extends State<DynamicAddNewButton> {

  @override
  Widget build(BuildContext context) {
    final List<FanMenuItem> items = widget.buttons
        .map(
          (ActionButtons<dynamic> btn) => FanMenuItem(
            onTap: () {
              btn.action();
            },
            itemWidget: Container(
              constraints: const BoxConstraints.tightFor(),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    offset: Offset(1, 1),
                    blurRadius: 1,
                    color: Colors.black26,
                  ),
                ],
                border: Border.all(color: Colors.white, width: 2.0),
              ),
              child: Padding(
                padding: const EdgeInsetsGeometry.all(5),
                child: Row(
                  textDirection: .rtl,
                  textBaseline: .alphabetic,
                  spacing: 15,
                  children: <Widget>[
                    (btn.icon != null)
                        ? IconTheme(
                            data: const IconThemeData(
                              color: Colors.white,
                              size: 20,
                            ),
                            child: btn.icon!,
                          )
                        : const Icon(
                            Icons.warning_amber,
                            color: Colors.white,
                            size: 20,
                          ),
                    CustomText(btn.title ?? ''),
                  ],
                ),
              ),
            ),
          ),
        )
        .toList();

    return FanFloatingMenu(
      toggleButtonColor: Colors.black,
      // onTab: () => <bool>{_isOpen = !_isOpen},
      fanMenuDirection: FanMenuDirection.rtl,
      menuItems: (items),
    );
  }
}
