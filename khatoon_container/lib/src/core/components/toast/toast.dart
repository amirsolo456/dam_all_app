import 'package:flutter/material.dart';
import 'package:khatoon_container/src/app/theme/app_color.dart';
import 'package:khatoon_container/src/core/constants/extensions.dart';
import 'package:toastification/toastification.dart';

class ModernToast extends StatelessWidget {
  const ModernToast({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors =context.colors;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 200,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              showToast(
                context,
                'Success',
                'Simple success toast',
                ToastificationType.success,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ThemeData().primaryColor,//Theme.of(context).colorScheme.primary,
            ),
            child:   Text('Success', style: TextStyle(color: colors.text)),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 200,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              showToast(
                context,
                'Info',
                'Simple info toast',
                ToastificationType.info,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            child: const Text('Info', style: TextStyle(color: Colors.white)),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 200,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              showToast(
                context,
                'Warning',
                'Simple warning toast',
                ToastificationType.warning,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            child: const Text('Warning', style: TextStyle(color: Colors.white)),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 200,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              showToast(
                context,
                'Error',
                'Simple error toast',
                ToastificationType.error,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            child: const Text('Error', style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }

  void showToast(
    BuildContext context,
    String title,
    String description,
    ToastificationType type,
  ) {
    toastification.show(
      context: context,
      type: type,
      title: title,
      description: description,
      primaryColor: Colors.white,
      animationDuration: const Duration(milliseconds: 500),
      pauseOnHover: false,
      autoCloseDuration: const Duration(seconds: 5),
      progressBarTheme: ProgressIndicatorThemeData(
        color: type == ToastificationType.success
            ? Colors.green
            : type == ToastificationType.info
            ? Colors.blue
            : type == ToastificationType.warning
            ? Colors.orange
            : Colors.red,
      ),
      showProgressBar: true,
      backgroundColor: type == ToastificationType.success
          ? Colors.green
          : type == ToastificationType.info
          ? Colors.blue
          : type == ToastificationType.warning
          ? Colors.orange
          : Colors.red,
      foregroundColor: Colors.white,
    );
  }
}
