import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_algo_studio/domain/entity/task.dart';
import 'package:test_algo_studio/domain/use_case/add_task.dart';
import 'package:test_algo_studio/domain/use_case/delete_task.dart';
import 'package:test_algo_studio/domain/use_case/get_task.dart';
import 'package:test_algo_studio/domain/use_case/impl/add_task_impl.dart';
import 'package:test_algo_studio/domain/use_case/impl/delete_task_impl.dart';
import 'package:test_algo_studio/domain/use_case/impl/get_task_impl.dart';
import 'package:test_algo_studio/domain/use_case/impl/update_task_impl.dart';
import 'package:test_algo_studio/domain/use_case/update_task.dart';
import 'package:test_algo_studio/presentation/controller/task/task_event.dart';
import 'package:test_algo_studio/presentation/controller/task/task_state.dart';
import 'package:test_algo_studio/presentation/controller/util/base_controller.dart';

class TaskController extends BaseController<TaskEvent, TaskState> {
  final AddTask _addTaskUseCase;
  final UpdateTask _updateTaskUseCase;
  final GetTask _getTaskUseCase;
  final DeleteTask _deleteTaskUseCase;

  TaskController(
    this._addTaskUseCase,
    this._updateTaskUseCase,
    this._getTaskUseCase,
    this._deleteTaskUseCase,
  ) : super(TaskState.initial());

  _get() async {
    if (state.allTask is AsyncLoading) return;
    state = state.copyWith(allTask: const AsyncLoading());
    final result = await _getTaskUseCase();
    state = state.copyWith(allTask: AsyncValue.data(result));
  }

  _add(Task task) async {
    if (state.addTask is AsyncLoading) return;
    state = state.copyWith(addTask: const AsyncLoading());
    final newTask = await _addTaskUseCase(task);
    final prevAllData = state.allTask.value ?? [];
    final prevData = state.allTask.value
        ?.where(
          (element) =>
              element.date.year == newTask.date.year &&
              element.date.month == newTask.date.month &&
              element.date.day == newTask.date.day,
        )
        .firstOrNull;
    if (prevData != null) {
      final index = prevAllData.indexOf(prevData);
      final newTaskGroup = prevData.copyWith(
        tasks: [...prevData.tasks, newTask],
      );
      prevAllData[index] = newTaskGroup;
      state = state.copyWith(newTask: newTask);
    } else {
      state = state.copyWith(newTask: newTask);
    }
    state = state.copyWith(addTask: const AsyncValue.data(true));
  }

  _delete(Task task) async {
    if (state.deleteTask is AsyncLoading) return;
    state = state.copyWith(deleteTask: const AsyncLoading());
    await _deleteTaskUseCase(task);
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
      state = state.copyWith(
        allTask: AsyncValue.data(prevAllData),
        deletedTask: task,
      );
    }
    state = state.copyWith(deleteTask: const AsyncValue.data(true));
  }

  _update(Task task) async {
    if (state.updateTask is AsyncLoading) return;
    state = state.copyWith(updateTask: const AsyncLoading());
    await _updateTaskUseCase(task);
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
        tasks: prevData.tasks.map((e) => e.id == task.id ? task : e).toList(),
      );
      prevAllData[index] = newTaskGroup;
      state = state.copyWith(allTask: const AsyncValue.data([]));
      state = state.copyWith(allTask: AsyncValue.data(prevAllData));
    }
    state = state.copyWith(updateTask: const AsyncValue.data(true));
  }

  @override
  Future<void> onEvent(TaskEvent event) async {
    await event.when(
      get: _get,
      add: _add,
      delete: _delete,
      update: _update,
      clearPreviousValue: () {
        state = state.copyWith(
          newTaskTitle: '',
          newTaskDescription: '',
          newTaskDate: DateTime.now(),
          newTaskTime: null,
        );
      },
      updateTaskTitle: (title) {
        state = state.copyWith(newTaskTitle: title);
      },
      updateTaskDescription: (description) {
        state = state.copyWith(newTaskDescription: description);
      },
      updateTaskDate: (date) {
        state = state.copyWith(newTaskDate: date);
      },
      updateTaskTime: (time) {
        state = state.copyWith(newTaskTime: time);
      },
    );
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
    } else if (event is Update) {
      state = state.copyWith(updateTask: AsyncValue.error(error, stackTrace));
    }
  }
}

final taskControllerProvider =
    StateNotifierProvider.autoDispose<TaskController, TaskState>(
  (ref) => TaskController(
    ref.read(addTaskProvider),
    ref.read(updateTaskProvider),
    ref.read(getTaskProvider),
    ref.read(deleteTaskProvider),
  ),
);
