import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_algo_studio/presentation/controller/task/task_controller.dart';
import 'package:test_algo_studio/presentation/controller/task/task_event.dart';
import 'package:test_algo_studio/presentation/screen/task/widget/list_task.dart';
import 'package:test_algo_studio/presentation/screen/task/widget/new_task_button.dart';

@RoutePage()
class TaskScreen extends ConsumerStatefulWidget {
  const TaskScreen({super.key});

  @override
  ConsumerState<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends ConsumerState<TaskScreen> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
        centerTitle: false,
        actions: const [
          NewTaskButton(),
          SizedBox(width: 8),
        ],
      ),
      body: ref
          .watch(taskControllerProvider.select((value) => value.allTask))
          .when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, __) => Center(child: Text(err.toString())),
            data: (tasks) => ListTask(tasks: tasks),
          ),
    );
  }
}
