import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_algo_studio/presentation/controller/task/task_controller.dart';
import 'package:test_algo_studio/presentation/controller/task/task_event.dart';
import 'package:test_algo_studio/presentation/router/app_router.gr.dart';

class NewTaskButton extends ConsumerWidget {
  const NewTaskButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: Colors.blue,
        iconColor: Colors.white,
      ),
      onPressed: () {
        final taskController = ref.read(taskControllerProvider.notifier);
        taskController.emit(const TaskEvent.clearPreviousValue());
        context.pushRoute(AddTaskRoute());
      },
      child: Row(
        children: [
          const Icon(Icons.add),
          const SizedBox(width: 4),
          Text(
            'New Task',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}