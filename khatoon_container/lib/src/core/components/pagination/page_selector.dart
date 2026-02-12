import 'package:flutter/material.dart';

class CircularArrow extends StatelessWidget {
  final Icon icon;
  final Function() onPressed;
  const CircularArrow({required this.icon, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary, child: icon),
      iconSize: 25,
    );
  }
}

class PageSelector extends StatefulWidget {
  final List<String> textArray;
  final Function(int) onChange;

  const PageSelector(
      {required this.textArray, required this.onChange, super.key});

  @override
  State<PageSelector> createState() => _PageSelectorState();
}

class _PageSelectorState extends State<PageSelector> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CircularArrow(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              if (_currentIndex <= 0) {
                return;
              }
              widget.onChange(_currentIndex);
              setState(() {
                _currentIndex -= 1;
              });
            }),
        Text(widget.textArray[_currentIndex],
            style: Theme.of(context).textTheme.bodyMedium),
        CircularArrow(
            icon: const Icon(Icons.keyboard_arrow_right),
            onPressed: () {
              if (_currentIndex >= widget.textArray.length - 1) {
                return;
              }
              widget.onChange(_currentIndex);
              setState(() {
                _currentIndex += 1;
              });
            }),
      ],
    );
  }
}
