import 'package:flutter/material.dart';
import 'package:khatoon_container/src/features/persons/data/models/person_model.dart';

class CustomerPickerDialog extends StatelessWidget {
  final List<PersonModel> persons;
  final String title;

  const CustomerPickerDialog({
    super.key,
    required this.persons,
    this.title = 'Select Customer',
  });

  static Future<PersonModel?> show(
      BuildContext context, List<PersonModel> persons,
      {String title = 'Select Customer'}) {
    return showDialog<PersonModel>(
      context: context,
      builder: (_) => CustomerPickerDialog(persons: persons, title: title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: persons.length,
          itemBuilder: (_, int index) {
            final PersonModel person = persons[index];
            return ListTile(
              title: Text('${person.name} ${person.familyName}'),
              subtitle: Text(person.fullAddress),
              onTap: () => Navigator.of(context).pop(person),
            );
          },
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        )
      ],
    );
  }
}
