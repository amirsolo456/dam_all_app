import 'package:flutter/material.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class ModernDialogs extends StatelessWidget {
  const ModernDialogs({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color textColor = theme.textTheme.labelLarge?.color ?? Colors.white;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              showModernDialog(
                context,
                "Operation Successful",
                "Your request has been processed successfully.",
                "Acknowledge",
                () {},
                PanaraDialogType.success,
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 50),
              backgroundColor: theme.colorScheme.primary,
            ),
            child: Text('Success Dialog', style: TextStyle(color: textColor)),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              showModernDialog(
                context,
                "Error Occurred",
                "We apologize, but an error has occurred while processing your request. Please try again later or contact support if the issue persists.",
                "Understood",
                () {
                  Navigator.pop(context);
                },
                PanaraDialogType.error,
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 50),
              backgroundColor: theme.colorScheme.error,
            ),
            child: Text('Error Dialog', style: TextStyle(color: textColor)),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              showModernDialog(
                context,
                "Important Notice",
                "Please be advised that this action may have significant consequences. Proceed with caution.",
                "Understood",
                () {},
                PanaraDialogType.warning,
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 50),
              backgroundColor: theme.colorScheme.secondary,
            ),
            child: Text('Warning Dialog', style: TextStyle(color: textColor)),
          ),
        ],
      ),
    );
  }

  void showModernDialog(
    BuildContext context,
    String title,
    String message,
    String buttonText,
    Function() onTapDismiss,
    PanaraDialogType type,
  ) {
    PanaraInfoDialog.show(
      context,
      title: title,
      message: message,
      buttonText: buttonText,
      onTapDismiss: () {
        Navigator.pop(context);
      },
      panaraDialogType: type,
    );
  }
}
