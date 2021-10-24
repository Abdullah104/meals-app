import 'package:flutter/material.dart';

class Ingredient extends StatelessWidget {
  const Ingredient({
    Key? key,
    required this.ingredient,
  }) : super(key: key);

  final String ingredient;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondary,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Text(ingredient),
      ),
    );
  }
}
