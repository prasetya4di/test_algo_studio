import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:test_algo_studio/domain/entity/task.dart';
import 'package:test_algo_studio/presentation/controller/task/task_controller.dart';
import 'package:test_algo_studio/presentation/controller/task/task_event.dart';
import 'package:test_algo_studio/presentation/screen/task/widget/delete_task_button.dart';

class TaskItem extends ConsumerStatefulWidget {
  final Task task;

  const TaskItem({super.key, required this.task});

  @override
  ConsumerState<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends ConsumerState<TaskItem> {
  bool _showDelete = false;

  @override
  Widget build(BuildContext context) {
    final textTime = DateFormat('HH:mm').format(widget.task.date);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: ListTile(
              onLongPress: () {
                if (!_showDelete) {
                  HapticFeedback.vibrate();
                }
                setState(() {
                  _showDelete = !_showDelete;
                });
              },
              onTap: () {
                if (_showDelete) {
                  setState(() {
                    _showDelete = !_showDelete;
                  });
                }
                final taskController =
                    ref.read(taskControllerProvider.notifier);
                taskController.emit(TaskEvent.update(
                    widget.task.copyWith(isComplete: !widget.task.isComplete)));
              },
              title: Text(widget.task.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.task.useTime) ...[
                    const SizedBox(height: 4),
                    Text(
                      "Time: $textTime",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.blue,
                          ),
                    ),
                  ],
                  const SizedBox(height: 4),
                  Text(widget.task.description),
                ],
              ),
              leading: Checkbox(
                value: widget.task.isComplete,
                onChanged: (value) {},
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 4),
              horizontalTitleGap: 0,
            ),
          ),
          if (_showDelete) ...[
            const SizedBox(height: 8),
            DeleteTaskButton(
                task: widget.task,
            ),
          ],
        ],
      ),
    );
  }
}
