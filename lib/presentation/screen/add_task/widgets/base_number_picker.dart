import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class BaseNumberPicker extends StatelessWidget {
  final int value;
  final int? minValue;
  final int? maxValue;
  final ValueChanged<int> onChanged;

  const BaseNumberPicker(
      {super.key,
      required this.value,
      required this.onChanged,
      this.minValue,
      this.maxValue});

  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      minValue: minValue ?? 0,
      maxValue: maxValue ?? 60,
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
