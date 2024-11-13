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

class _TaskItemState extends ConsumerState<TaskItem>
    with SingleTickerProviderStateMixin {
  bool _showDelete = false;
  bool _isComplete = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _isComplete = widget.task.isComplete;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reset();
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTime = DateFormat('HH:mm').format(widget.task.date);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.rotate(
                angle: _animation.value * 0.2,
                child: Card(
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
                      _controller.forward();
                      setState(() {
                        _isComplete = !_isComplete;
                      });
                      final taskController =
                          ref.read(taskControllerProvider.notifier);
                      taskController.emit(TaskEvent.update(
                          widget.task.copyWith(isComplete: _isComplete)));
                    },
                    title: Text(widget.task.title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (widget.task.useTime) ...[
                          const SizedBox(height: 4),
                          Text(
                            "Time: $textTime",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.blue,
                                    ),
                          ),
                        ],
                        const SizedBox(height: 4),
                        Text(widget.task.description),
                      ],
                    ),
                    leading: Checkbox(
                      value: _isComplete,
                      onChanged: (value) {},
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                    horizontalTitleGap: 0,
                  ),
                ),
              );
            },
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
