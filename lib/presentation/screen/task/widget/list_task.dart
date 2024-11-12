import 'package:easy_sticky_header/easy_sticky_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_algo_studio/domain/entity/task_group.dart';
import 'package:test_algo_studio/presentation/controller/task/task_controller.dart';
import 'package:test_algo_studio/presentation/controller/task/task_event.dart';
import 'package:test_algo_studio/presentation/screen/task/widget/task_date_header.dart';
import 'package:test_algo_studio/presentation/screen/task/widget/task_item.dart';

class ListTask extends ConsumerStatefulWidget {
  const ListTask({super.key});

  @override
  ConsumerState<ListTask> createState() => _ListTaskState();
}

class _ListTaskState extends ConsumerState<ListTask> {
  Map<DateTime, GlobalKey<AnimatedListState>> _listKey = {};

  List<TaskGroup> _tasks = [];

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
      final taskController = ref.read(taskControllerProvider.notifier);
      taskController.emit(const TaskEvent.get());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      taskControllerProvider.select((value) => value.allTask),
      (prev, state) {
        state.whenData((data) {
          setState(() {
            _tasks = data;
            _listKey = {
              for (final e in _tasks) e.date: GlobalKey<AnimatedListState>()
            };
          });
        });
      },
    );

    ref.listen(
      taskControllerProvider.select((value) => value.newTask),
          (prev, state) {
        if (state != null) {
          final task = state;
          final dateKey = DateTime(task.date.year, task.date.month, task.date.day);
          final index = _tasks.indexWhere((element) => element.date == dateKey);

          if (index != -1) {
            setState(() {
              _tasks[index].tasks.insert(0, task);
            });
            _listKey[dateKey]?.currentState?.insertItem(0);
          } else {
            setState(() {
              _tasks.insert(0, TaskGroup(date: dateKey, tasks: [task]));
              _listKey[dateKey] = GlobalKey<AnimatedListState>(); // Add new key
            });
            _listKey[dateKey]?.currentState?.insertItem(0);
          }
        }
      },
    );

    return StickyHeader(
      child: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final data = _tasks[index];
          return Column(
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
                      child: TaskItem(task: task));
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
