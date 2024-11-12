import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_algo_studio/domain/entity/task.dart';
import 'package:test_algo_studio/domain/entity/task_group.dart';
import 'package:test_algo_studio/presentation/controller/task/task_event.dart';
import 'package:test_algo_studio/presentation/controller/task/task_state.dart';
import 'package:test_algo_studio/presentation/controller/util/base_controller.dart';

class TaskController extends BaseController<TaskEvent, TaskState> {
  TaskController() : super(TaskState.initial());

  _get() async {
    if (state.allTask is AsyncLoading) return;
    state = state.copyWith(allTask: const AsyncLoading());
    // Todo get all task use case
    state = state.copyWith(
      allTask: AsyncValue.data(
        [
          TaskGroup(
            date: DateTime(2024, 11, 12),
            tasks: [
              Task(
                id: 1,
                title: 'Task 1',
                description: 'Description 1',
                date: DateTime(2024, 11, 12),
                useTime: false,
                isComplete: false,
              ),
              Task(
                id: 2,
                title: 'Task 2',
                description: 'Description 2',
                date: DateTime(2024, 11, 12),
                useTime: false,
                isComplete: false,
              ),
              Task(
                id: 3,
                title: 'Task 3',
                description: 'Description 3',
                date: DateTime(2024, 11, 12, 11, 0, 0),
                useTime: true,
                isComplete: false,
              ),
              Task(
                id: 4,
                title: 'Task 4',
                description: 'Description 3',
                date: DateTime(2024, 11, 12, 12, 0, 0),
                useTime: true,
                isComplete: false,
              ),
            ],
          ),
          TaskGroup(
            date: DateTime(2024, 11, 13),
            tasks: [
              Task(
                id: 9,
                title: 'Prepare Presentation',
                description: 'Prepare slides for the client presentation',
                date: DateTime(2024, 11, 13),
                useTime: false,
                isComplete: false,
              ),
              Task(
                id: 10,
                title: 'Team Lunch',
                description: 'Have lunch with the team',
                date: DateTime(2024, 11, 13, 12, 30, 0),
                useTime: true,
                isComplete: false,
              ),
              Task(
                id: 11,
                title: 'Send Invoice',
                description: 'Send invoice to Client B',
                date: DateTime(2024, 11, 13),
                useTime: false,
                isComplete: false,
              ),
              Task(
                id: 12,
                title: 'Brainstorm Ideas',
                description: 'Brainstorm new ideas for upcoming projects',
                date: DateTime(2024, 11, 13, 15, 0, 0),
                useTime: true,
                isComplete: false,
              ),
            ],
          ),
          TaskGroup(
            date: DateTime(2024, 11, 14),
            tasks: [
              Task(
                id: 13,
                title: 'Pay Bills',
                description: 'Pay all pending utility bills',
                date: DateTime(2024, 11, 15),
                useTime: false,
                isComplete: false,
              ),
              Task(
                id: 14,
                title: 'Call Mom',
                description: 'Call mom to catch up',
                date: DateTime(2024, 11, 15),
                useTime: false,
                isComplete: false,
              ),
              Task(
                id: 15,
                title: 'Read Book',
                description: 'Continue reading the current book',
                date: DateTime(2024, 11, 15),
                useTime: false,
                isComplete: false,
              ),
              Task(
                id: 16,
                title: 'Workout',
                description: 'Go for a run or hit the gym',
                date: DateTime(2024, 11, 15),
                useTime: false,
                isComplete: false,
              ),
            ],
          ),
        ],
      ),
    );
  }

  _add(Task task) async {
    if (state.addTask is AsyncLoading) return;
    state = state.copyWith(addTask: const AsyncLoading());
    // Todo add task use case
    final prevAllData = state.allTask.value ?? [];
    final prevData = state.allTask.value
        ?.where(
          (element) =>
              element.date.year == task.date.year &&
              element.date.month == task.date.month &&
              element.date.day == task.date.day,
        )
        .firstOrNull;
    if (prevData != null) {
      final index = prevAllData.indexOf(prevData);
      final newTaskGroup = prevData.copyWith(
        tasks: [...prevData.tasks, task],
      );
      prevAllData[index] = newTaskGroup;
      state = state.copyWith(allTask: AsyncValue.data(prevAllData));
    } else {
      final newTaskGroup = TaskGroup(
        date: task.date,
        tasks: [task],
      );
      state = state.copyWith(
        allTask: AsyncValue.data([...prevAllData, newTaskGroup]),
      );
    }
    // Todo remove all mock data
    state = state.copyWith(addTask: const AsyncValue.data(true));
  }

  _delete(Task task) async {
    if (state.deleteTask is AsyncLoading) return;
    state = state.copyWith(deleteTask: const AsyncLoading());
    // Todo delete task use case
    final prevAllData = state.allTask.value ?? [];
    final prevData = state.allTask.value
        ?.where(
          (element) =>
              element.date.year == task.date.year &&
              element.date.month == task.date.month &&
              element.date.day == task.date.day,
        )
        .firstOrNull;
    if (prevData != null) {
      final index = prevAllData.indexOf(prevData);
      final newTaskGroup = prevData.copyWith(
        tasks:
            prevData.tasks.where((element) => element.id != task.id).toList(),
      );
      prevAllData[index] = newTaskGroup;
      state = state.copyWith(allTask: AsyncValue.data(prevAllData));
    }
    // Todo remove all mock data
    state = state.copyWith(deleteTask: const AsyncValue.data(true));
  }

  @override
  Future<void> onEvent(TaskEvent event) async {
    await event.when(get: _get, add: _add, delete: _delete);
  }

  @override
  Future<void> onEventError(
      TaskEvent event, Object error, StackTrace stackTrace) async {
    if (event is Get) {
      state = state.copyWith(allTask: AsyncValue.error(error, stackTrace));
    } else if (event is Add) {
      state = state.copyWith(addTask: AsyncValue.error(error, stackTrace));
    } else if (event is Delete) {
      state = state.copyWith(deleteTask: AsyncValue.error(error, stackTrace));
    }
  }
}

final taskControllerProvider =
    StateNotifierProvider.autoDispose<TaskController, TaskState>(
  (ref) => TaskController(),
);
