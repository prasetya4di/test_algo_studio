import 'package:flutter/material.dart';
import 'package:test_algo_studio/presentation/screen/add_task/widgets/task_form_template.dart';

class TaskTitleTextField extends StatelessWidget {
  const TaskTitleTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TaskFormTemplate(
        label: "Title",
        child: TextFormField(
          onTapOutside: (_) {
            FocusScope.of(context).unfocus();
          },
          onSaved: (value) {},
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the correct task title';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: "Title Task",
            filled: true,
            fillColor: Colors.grey[300],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        )
    );
  }
}