import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class AwesomeSnackbar extends StatelessWidget {
  const AwesomeSnackbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Hi There!',
              message:
              'You need to use this package in the app to uplift your Snackbar Experience!',
              contentType: ContentType.warning,
            ),
          ));
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        child: Text(
          'Show Snackbar',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
