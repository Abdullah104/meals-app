import 'package:flutter/material.dart';

class MealStep extends StatelessWidget {
  const MealStep({
    Key? key,
    required this.index,
    required this.step,
  }) : super(key: key);

  final int index;
  final String step;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            child: Text('#${index + 1}'),
          ),
          title: Text(step),
        ),
        const Divider(),
      ],
    );
  }
}
