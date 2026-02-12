import 'package:flutter/material.dart';

class SecondaryTabBar extends StatefulWidget {
  final double radius;

  const SecondaryTabBar({super.key, this.radius = 0});

  @override
  State<SecondaryTabBar> createState() => _SecondaryTabBarState();
}

class _SecondaryTabBarState extends State<SecondaryTabBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(widget.radius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.radius),
        child: Row(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
                child: Container(
                  color: _selectedIndex == 0
                      ? Theme.of(context).colorScheme.primary
                      : Colors.transparent,
                  child: Center(
                    child: Text(
                      'Home',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
                child: Container(
                  color: _selectedIndex == 1
                      ? Theme.of(context).colorScheme.primary
                      : Colors.transparent,
                  child: Center(
                    child: Text(
                      'Contact',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
                child: Container(
                  color: _selectedIndex == 2
                      ? Theme.of(context).colorScheme.primary
                      : Colors.transparent,
                  child: Center(
                    child: Text(
                      'About',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
