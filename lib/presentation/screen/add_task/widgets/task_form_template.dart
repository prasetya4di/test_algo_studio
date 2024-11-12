import 'package:flutter/material.dart';

class TaskFormTemplate extends StatelessWidget {
  final String label;
  final Widget child;

  const TaskFormTemplate({super.key, required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}
