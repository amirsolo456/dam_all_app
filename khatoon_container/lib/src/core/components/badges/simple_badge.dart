import 'package:badges/badges.dart' as badges;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  const Badge({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: badges.Badge(
        badgeContent: Text('3', style: Theme.of(context).textTheme.bodyMedium),
        badgeStyle: badges.BadgeStyle(
          badgeColor: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          borderRadius: BorderRadius.circular(30),
        ),
        position: badges.BadgePosition.topEnd(end: 0, top: 0),
        child: const Icon(CupertinoIcons.shopping_cart, size: 70),
      ),
    );
  }
}
