import 'package:flutter/material.dart';

class ToggleItem extends StatelessWidget {
  const ToggleItem(
      {required this.title,
      required this.value,
      required this.onChanged,
      Key? key})
      : super(key: key);

  final bool value;
  final String title;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SwitchListTile(
        value: value,
        title: Text(title, style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 12, fontWeight: FontWeight.w600),),
        onChanged: onChanged,
      ),
    );
  }
}