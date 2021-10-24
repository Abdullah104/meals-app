import 'package:flutter/material.dart';

class Filter extends StatelessWidget {
  final bool value;
  final Function(bool) toggleHandler;
  final String title;
  final String subtitle;

  const Filter({
    Key? key,
    required this.value,
    required this.toggleHandler,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      value: value,
      onChanged: toggleHandler,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
