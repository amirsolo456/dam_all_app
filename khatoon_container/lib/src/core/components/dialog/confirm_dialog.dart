import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final Function(bool) function;
  const ConfirmationDialog({super.key, required this.function});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext ctx) {
                return AlertDialog(
                  title: const Text('Please Confirm'),
                  content: const Text('Are you sure to remove the box?'),
                  actions: <Widget>[
                    // The "Yes" button
                    TextButton(
                        onPressed: () {
                          function(true);
                          Navigator.of(context).pop();
                        },
                        child: const Text('Yes')),
                    TextButton(
                        onPressed: () {
                          function(false);
                          Navigator.of(context).pop();
                        },
                        child: const Text('No'))
                  ],
                );
              });
        },
        child: const Text('Delete'));
  }
}
