import 'package:flutter/material.dart';
import 'package:test_algo_studio/domain/entity/task.dart';
import 'package:test_algo_studio/presentation/screen/task/widget/delete_task_confirmation_bottom_sheet.dart';

class DeleteTaskButton extends StatelessWidget {
  final Task task;

  const DeleteTaskButton({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: Colors.white,
          iconColor: Colors.red,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            useSafeArea: true,
            useRootNavigator: true,
            isScrollControlled: true,
            showDragHandle: true,
            builder: (context) => DeleteTaskConfirmationBottomSheet(
              task: task,
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.delete),
              const SizedBox(width: 4),
              Text(
                'Delete Task',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
