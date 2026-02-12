import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final FormFieldValidator<String>? validator;

  const CustomTextField({
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return TextFormField(
      cursorColor: theme.colorScheme.onSurface,
      style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface),
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        hintText: hintText,
        hintStyle: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.colorScheme.primary),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.colorScheme.onSurface.withAlpha(800)),
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.colorScheme.error),
          borderRadius: BorderRadius.circular(8.0),
        ),
        filled: true,
        fillColor: theme.colorScheme.surface.withAlpha(800), // Glassmorphism input field
      ),
    );
  }
}

class EmailPasswordWidget extends StatefulWidget {
  const EmailPasswordWidget({super.key});

  @override
  EmailPasswordWidgetState createState() => EmailPasswordWidgetState();
}

class EmailPasswordWidgetState extends State<EmailPasswordWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10),
            CustomTextField(
              controller: _emailController,
              hintText: 'Email',
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                // Basic email validation
                final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                if (!emailRegex.hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            CustomTextField(
              controller: _passwordController,
              hintText: 'Password',
              obscureText: true,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                // Add more password validation rules if needed
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Handle forgot password logic
                  },
                  child: Text(
                    'Forgot Password?',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: double.infinity, // Make the button full-width
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Handle sign in logic
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary, // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  shadowColor: theme.shadowColor.withAlpha(300),
                  elevation: 8,
                ),
                child: Text(
                  'Sign In',
                  style: theme.textTheme.labelLarge?.copyWith(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
