import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_algo_studio/domain/entity/task.dart';
import 'package:test_algo_studio/presentation/controller/task/task_controller.dart';
import 'package:test_algo_studio/presentation/controller/task/task_event.dart';
import 'package:test_algo_studio/presentation/screen/add_task/widgets/cancel_button.dart';
import 'package:test_algo_studio/presentation/screen/task/widget/delete_button.dart';

class DeleteTaskConfirmationBottomSheet extends ConsumerWidget {
  final Task task;

  const DeleteTaskConfirmationBottomSheet({super.key, required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Delete Confirmation",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              "Are you sure you want to delete ${task.title} task?",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CancelButton(
                  borderColor: Colors.red,
                  onPressed: () {
                    context.maybePop();
                  },
                ),
                const SizedBox(width: 8),
                DeleteButton(
                  onPressed: () {
                    final taskController =
                        ref.read(taskControllerProvider.notifier);
                    taskController.emit(TaskEvent.delete(task));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
