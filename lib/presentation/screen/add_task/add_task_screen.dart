import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_algo_studio/domain/entity/task.dart';
import 'package:test_algo_studio/presentation/controller/task/task_controller.dart';
import 'package:test_algo_studio/presentation/controller/task/task_event.dart';
import 'package:test_algo_studio/presentation/router/app_router.gr.dart';
import 'package:test_algo_studio/presentation/screen/add_task/widgets/add_task_form.dart';
import 'package:test_algo_studio/presentation/screen/add_task/widgets/cancel_button.dart';
import 'package:test_algo_studio/presentation/screen/add_task/widgets/save_button.dart';

@RoutePage()
class AddTaskScreen extends ConsumerWidget {
  AddTaskScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    showFailedSnackBar() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to add new task'),
        ),
      );
    }

    ref.listen(
      taskControllerProvider.select((value) => value.addTask),
      (prevState, state) {
        state.when(
          data: (data) {
            context.router.popUntilRouteWithName(AddTaskRoute.name);
            if (data) {
              context.router.popUntilRouteWithName(TaskRoute.name);
            } else {
              showFailedSnackBar();
            }
          },
          error: (_, __) {
            context.router.popUntilRouteWithName(AddTaskRoute.name);
            showFailedSnackBar();
          },
          loading: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return const Dialog(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(width: 20),
                        Text("Loading..."),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Task'),
      ),
      body: Form(
        key: _formKey,
        child: const SingleChildScrollView(
          padding: EdgeInsets.all(12),
          child: AddTaskForm(),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Row(
            children: [
              CancelButton(onPressed: () {
                context.maybePop();
              }),
              const SizedBox(width: 12),
              SaveButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();

                    final taskState = ref.read(taskControllerProvider);
                    final newTask = Task(
                      id: 101,
                      title: taskState.newTaskTitle,
                      description: taskState.newTaskDescription,
                      date: DateTime(
                        taskState.newTaskDate.year,
                        taskState.newTaskDate.month,
                        taskState.newTaskDate.day,
                        taskState.newTaskTime?.hour ?? 0,
                        taskState.newTaskTime?.minute ?? 0,
                        0,
                      ),
                      useTime: taskState.newTaskTime != null,
                      isComplete: false,
                    );

                    final taskController =
                        ref.read(taskControllerProvider.notifier);
                    taskController.emit(TaskEvent.add(newTask));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
