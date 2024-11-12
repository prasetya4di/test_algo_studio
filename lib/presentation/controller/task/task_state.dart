import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_algo_studio/domain/entity/task_group.dart';

part 'task_state.freezed.dart';

@freezed
class TaskState with _$TaskState {
  const factory TaskState({
    required AsyncValue<List<TaskGroup>> allTask,
    required AsyncValue<bool> addTask,
    required AsyncValue<bool> updateTask,
    required AsyncValue<bool> deleteTask,
    required String newTaskTitle,
    required String newTaskDescription,
    required DateTime newTaskDate,
    required DateTime? newTaskTime,
  }) = _TaskState;

  factory TaskState.initial() => TaskState(
        allTask: const AsyncValue.data([]),
        addTask: const AsyncValue.data(false),
        updateTask: const AsyncValue.data(false),
        deleteTask: const AsyncValue.data(false),
        newTaskTitle: '',
        newTaskDescription: '',
        newTaskDate: DateTime.now(),
        newTaskTime: null,
      );
}
