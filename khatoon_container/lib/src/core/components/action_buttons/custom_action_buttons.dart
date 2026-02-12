import 'package:flutter/material.dart';

class CustomActionButtons extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String title;
  const CustomActionButtons(
      {super.key,
        required this.onTap,
        required this.icon,
        required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 166,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).colorScheme.primary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon),
            const SizedBox(width: 10),
            Text(title, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
 

class CustomButtons extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String title;
  const CustomButtons(
      {super.key,
        required this.onTap,
        required this.icon,
        required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 166,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).colorScheme.primary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(title,
                style:Theme.of(context).textTheme.bodyMedium),
            const SizedBox(width: 10),
            Icon(icon),
          ],
        ),
      ),
    );
  }
}

