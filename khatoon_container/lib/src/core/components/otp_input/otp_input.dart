import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpTextField extends StatefulWidget {
  const OtpTextField({super.key});

  @override
  State<OtpTextField> createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {
  final TextEditingController pinController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final Color focusedBorderColor = Colors.black;

  final Color fillColor = const Color.fromRGBO(243, 246, 249, 0);
  final Color borderColor = Colors.grey[800]!;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final PinTheme defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 22, color: theme.textTheme.bodyLarge?.color ?? Colors.black),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: theme.dividerColor),
      ),
    );

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Directionality(
            // Specify direction if desired
            textDirection: TextDirection.ltr,
            child: Pinput(
              controller: pinController,
              defaultPinTheme: defaultPinTheme,
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (String pin) {
                debugPrint('onCompleted: $pin');
              },
              onChanged: (String value) {
                debugPrint('onChanged: $value');
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 24,
                    height: 2,
                    color: theme.textTheme.bodyLarge?.color ?? Colors.black,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: theme.colorScheme.primary),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: theme.colorScheme.primary),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: theme.colorScheme.error),
              ),
            ),
          ),
        ],
      ),
    );
  }
  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }
}
