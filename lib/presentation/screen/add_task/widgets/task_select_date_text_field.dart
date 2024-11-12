import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:test_algo_studio/presentation/screen/add_task/widgets/select_date_bottom_sheet.dart';
import 'package:test_algo_studio/presentation/screen/add_task/widgets/task_form_template.dart';

class TaskSelectDateTextField extends StatefulWidget {
  const TaskSelectDateTextField({super.key});

  @override
  State<TaskSelectDateTextField> createState() =>
      _TaskSelectDateTextFieldState();
}

class _TaskSelectDateTextFieldState extends State<TaskSelectDateTextField> {
  DateTime _selectedDate = DateTime.now();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TaskFormTemplate(
        label: "Date",
        child: TextFormField(
          readOnly: true,
          controller: _controller,
          onTap: () {
            showModalBottomSheet(
              context: context,
              useSafeArea: true,
              useRootNavigator: true,
              isScrollControlled: true,
              showDragHandle: true,
              builder: (context) => SelectDateBottomSheet(
                initialSelectedDate: _selectedDate,
              ),
            ).then((value) {
              if (value == null) {
                return;
              }
              String text = DateFormat("dd MMMM yyyy").format(value);
              if (isSameDay(value, DateTime.now())) {
                text = "Today";
              } else if (isSameDay(
                  value, DateTime.now().add(const Duration(days: 1)))) {
                text = "Tomorrow";
              }

              setState(() {
                _selectedDate = value;
                _controller.text = text;
              });
            });
          },
          onSaved: (value) {},
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select correct date';
            }
            return null;
          },
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.calendar_month_outlined),
            hintText: "Select Date",
            filled: true,
            fillColor: Colors.grey[300],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ));
  }
}
