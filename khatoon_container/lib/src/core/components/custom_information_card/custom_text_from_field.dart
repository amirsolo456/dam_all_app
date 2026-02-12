import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String? initialValue;
  final TextInputType keyboardType;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String>? validator;
  final bool enabled;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.keyboardType,
    required this.onChanged,
    this.validator,
    this.initialValue,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      enabled: enabled,
      keyboardType: keyboardType,
      onChanged: onChanged,
      validator: validator,
      minLines: 1,
      textDirection: TextDirection.rtl,
      style: const TextStyle(
        fontSize: 16,
        fontFamily: 'Vazirani',
      ),
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      ),
    );
  }
}
