import 'package:easy_sticky_header/easy_sticky_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_algo_studio/domain/entity/task_group.dart';
import 'package:test_algo_studio/presentation/controller/task/task_controller.dart';
import 'package:test_algo_studio/presentation/screen/task/widget/task_date_header.dart';
import 'package:test_algo_studio/presentation/screen/task/widget/task_item.dart';

class ListTask extends ConsumerStatefulWidget {
  final List<TaskGroup> tasks;

  const ListTask({super.key, required this.tasks});

  @override
  ConsumerState<ListTask> createState() => _ListTaskState();
}

class _ListTaskState extends ConsumerState<ListTask> {
  final _headerListKey = GlobalKey<AnimatedListState>();
  Map<DateTime, GlobalKey<AnimatedListState>> _listKey = {};

  final List<TaskGroup> _tasks = [];

  @override
  void initState() {
    _tasks.addAll(widget.tasks);
    _listKey = {for (final e in _tasks) e.date: GlobalKey<AnimatedListState>()};

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      taskControllerProvider.select((value) => value.newTask),
      (prev, state) {
        if (state != null) {
          final task = state;
          final dateKey =
              DateTime(task.date.year, task.date.month, task.date.day);
          final index = _tasks.indexWhere((element) => element.date == dateKey);

          if (index != -1) {
            setState(() {
              _tasks[index].tasks.insert(0, task);
            });
            _listKey[dateKey]?.currentState?.insertItem(0);
          } else {
            setState(() {
              _tasks.add(TaskGroup(date: dateKey, tasks: [task]));
            });
            _headerListKey.currentState?.insertItem(_tasks.length - 1);
          }
        }
      },
    );

    ref.listen(
      taskControllerProvider.select((value) => value.deletedTask),
      (prev, state) {
        if (state != null) {
          final task = state;
          final dateKey =
              DateTime(task.date.year, task.date.month, task.date.day);
          final index = _tasks.indexWhere((element) => element.date == dateKey);

          if (index != -1) {
            final taskIndex = _tasks[index]
                .tasks
                .indexWhere((element) => element.id == task.id);
            if (taskIndex != -1) {
              final removedTask = _tasks[index].tasks[taskIndex];
              _tasks[index].tasks.removeAt(taskIndex);

              if (_tasks[index].tasks.isEmpty) {
                _tasks.removeAt(index);
                _headerListKey.currentState?.removeItem(
                  index,
                  (context, animation) => SizeTransition(
                    sizeFactor: animation,
                    child: TaskDateHeader(date: dateKey),
                  ),
                );
              } else {
                _listKey[dateKey]?.currentState?.removeItem(
                      taskIndex,
                      (context, animation) => SizeTransition(
                        sizeFactor: animation,
                        child: TaskItem(
                          task: removedTask,
                        ),
                      ),
                    );
              }
            }
          }
        }
      },
    );

    return StickyHeader(
      child: AnimatedList(
        key: _headerListKey,
        initialItemCount: _tasks.length,
        itemBuilder: (context, index, animation) {
          final data = _tasks[index];
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: const Offset(0, 0),
            ).animate(animation),
            child: Column(
              children: [
                StickyContainerWidget(
                  index: index,
                  child: TaskDateHeader(date: data.date),
                ),
                AnimatedList(
                  key: _listKey[data.date],
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  primary: false,
                  initialItemCount: data.tasks.length,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemBuilder: (context, index, animation) {
                    final task = data.tasks[index];
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: const Offset(0, 0),
                      ).animate(animation),
                      child: TaskItem(key: Key("${task.id}"),task: task),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
