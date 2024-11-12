import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_algo_studio/domain/entity/task_group.dart';

part 'task_state.freezed.dart';

@freezed
class TaskState with _$TaskState {
  const factory TaskState({
    required AsyncValue<List<TaskGroup>> allTask,
    required AsyncValue<bool> addTask,
    required AsyncValue<bool> deleteTask,
  }) = _TaskState;

  factory TaskState.initial() => const TaskState(
        allTask: AsyncValue.data([]),
        addTask: AsyncValue.data(false),
        deleteTask: AsyncValue.data(false),
      );
}
