import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_algo_studio/presentation/controller/task/task_controller.dart';
import 'package:test_algo_studio/presentation/controller/task/task_event.dart';
import 'package:test_algo_studio/presentation/screen/add_task/widgets/task_form_template.dart';

class TaskDescriptionTextField extends ConsumerWidget {
  const TaskDescriptionTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TaskFormTemplate(
        label: "Description",
        child: TextFormField(
          onTapOutside: (_) {
            FocusScope.of(context).unfocus();
          },
          onSaved: (value) {
            if (value != null) {
              final taskController = ref.read(taskControllerProvider.notifier);
              taskController.emit(TaskEvent.updateTaskDescription(value));
            }
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the correct task description';
            }
            return null;
          },
          minLines: 3,
          maxLines: 5,
          decoration: InputDecoration(
            hintText: "Description Task",
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
