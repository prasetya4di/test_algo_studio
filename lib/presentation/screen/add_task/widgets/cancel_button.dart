import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  final Color borderColor;
  final Function() onPressed;

  const CancelButton(
      {super.key, required this.onPressed, this.borderColor = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: Colors.white,
        ),
        onPressed: onPressed,
        child: Text(
          'Cancel',
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(fontWeight: FontWeight.bold, color: borderColor),
        ),
      ),
    );
  }
}
