import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskDateHeader extends StatelessWidget {
  final DateTime date;

  const TaskDateHeader({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    String text = "";

    final dateFormat = DateFormat("dd MMMM yyyy");
    final formattedDate = dateFormat.format(date);

    if (date.day == DateTime.now().day &&
        date.month == DateTime.now().month &&
        date.year == DateTime.now().year) {
      text = "Today ($formattedDate)";
    } else if (date.day == DateTime.now().day - 1 &&
        date.month == DateTime.now().month &&
        date.year == DateTime.now().year) {
      text = "Yesterday ($formattedDate)";
    } else if (date.day == DateTime.now().day + 1 &&
        date.month == DateTime.now().month &&
        date.year == DateTime.now().year) {
      text = "Tomorrow ($formattedDate)";
    } else {
      final dayOfWeek = DateFormat('EEE').format(date);
      text = "$dayOfWeek ($formattedDate)";
    }

    return Container(
      width: double.infinity,
      color: Colors.grey[200],
      padding: const EdgeInsets.all(12.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
      ),
    );
  }
}
