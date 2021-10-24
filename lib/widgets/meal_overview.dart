import 'package:flutter/material.dart';

class MealOverview extends StatelessWidget {
  const MealOverview({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 8,
        ),
        Text(text),
      ],
    );
  }
}
