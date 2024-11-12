import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class BaseNumberPicker extends StatelessWidget {
  final int value;
  final ValueChanged<int> onChanged;

  const BaseNumberPicker(
      {super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      minValue: 0,
      maxValue: 60,
      zeroPad: true,
      value: value,
      selectedTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
      onChanged: onChanged,
    );
  }
}
