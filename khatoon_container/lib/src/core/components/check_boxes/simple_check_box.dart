import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final VoidCallback onSelectionChanged;

  const CustomCheckbox({super.key, required this.onSelectionChanged});

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      visualDensity: const VisualDensity(
        horizontal: VisualDensity.maximumDensity,
        vertical: VisualDensity.maximumDensity,
      ),
      value: isChecked,
      onChanged: (bool? value) {
        widget.onSelectionChanged();
        setState(() {
          isChecked = value ?? false;
        });
      },
      checkColor: Theme.of(context).colorScheme.onPrimary,
      activeColor: Theme.of(context).colorScheme.primary,
      side: BorderSide(
        color: isChecked
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.primary,
        width: 2.0,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
    );
  }
}
