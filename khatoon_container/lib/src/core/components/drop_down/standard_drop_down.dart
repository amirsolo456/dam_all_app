import 'package:flutter/material.dart';

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  List<String> options = <String>['One', 'Two', 'Three', 'Four'];
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: DropdownButton<String>(
        value: dropdownValue,
        onChanged: (String? value) {
          setState(() {
            dropdownValue = value!;
          });
        },
        underline: const SizedBox(),
        isExpanded: true,
        dropdownColor: Theme.of(context).colorScheme.surface,
        icon: const Icon(Icons.keyboard_arrow_down),
        selectedItemBuilder: (BuildContext context) {
          return options.map((String value) {
            return Align(
              alignment: Alignment.centerLeft,
              child: Text(
                dropdownValue,
              ),
            );
          }).toList();
        },
        items: options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
