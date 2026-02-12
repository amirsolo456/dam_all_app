import 'package:fan_floating_menu/fan_floating_menu.dart';
import 'package:flutter/material.dart';

class  ComplexAddNewButton extends StatelessWidget {
  const ComplexAddNewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FanFloatingMenu(
      toggleButtonColor: Theme.of(context).colorScheme.primary,
      menuItems: <FanMenuItem>[
        FanMenuItem(
          onTap: () {},
          icon: Icons.edit_rounded,
          menuItemIconColor: Theme.of(context).colorScheme.primary,
          title: 'Edit Texts',
          menuItemColor: Theme.of(context).colorScheme.primary,
        ),
        FanMenuItem(
            onTap: () {},
            menuItemIconColor: Theme.of(context).colorScheme.primary,
            menuItemColor: Theme.of(context).colorScheme.primary,
            icon: Icons.save_rounded,
            title: 'Save Notes'),
        FanMenuItem(
            onTap: () {},
            menuItemColor: Theme.of(context).colorScheme.primary,
            menuItemIconColor: Theme.of(context).colorScheme.primary,
            icon: Icons.send_rounded,
            title: 'Send Images'),
      ],
    );
  }
}
