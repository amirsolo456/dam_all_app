import 'package:flutter/material.dart';

class ChoiceChipWidget extends StatefulWidget {
  const ChoiceChipWidget({super.key});

  @override
  State<ChoiceChipWidget> createState() => _ChoiceChipWidgetState();
}

class _ChoiceChipWidgetState extends State<ChoiceChipWidget> {
  // Use a set to keep track of selected indices
  final Set<int> _selectedIndices = <int>{};

  final List<String> _options = <String>[
    'Nature',
    'Tech',
    'Traditions',
    'Philosophy',
    'Art',
    'Leadership',
    'Food',
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      runSpacing: 15.0,
      children: List<Widget>.generate(_options.length, (int index) {
        return ChoiceChip(
          label: Text(_options[index]),
          selected: _selectedIndices.contains(index),
          onSelected: (bool selected) {
            setState(() {
              if (selected) {
                _selectedIndices.add(index);
              } else {
                _selectedIndices.remove(index);
              }
            });
          },
          iconTheme: const IconThemeData(color: Colors.black, size: 20.0),
          selectedColor: Theme.of(context).colorScheme.primary,
          backgroundColor: Theme.of(context).colorScheme.surface,
          disabledColor: Colors.grey,
          labelStyle: Theme.of(context).textTheme.bodyMedium,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: const BorderSide(color: Colors.transparent),
          ),
        );
      }).toList(),
    );
  }
}
