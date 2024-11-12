import 'package:flutter/material.dart';
import 'package:test_algo_studio/presentation/screen/add_task/widgets/task_description_text_field.dart';
import 'package:test_algo_studio/presentation/screen/add_task/widgets/task_select_date_text_field.dart';
import 'package:test_algo_studio/presentation/screen/add_task/widgets/task_time_text_field.dart';
import 'package:test_algo_studio/presentation/screen/add_task/widgets/task_title_text_field.dart';

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({super.key});

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TaskTitleTextField(),
        SizedBox(height: 12),
        TaskDescriptionTextField(),
        SizedBox(height: 12),
        TaskSelectDateTextField(),
        SizedBox(height: 12),
        TaskTimeTextField(),
      ],
    );
  }
}