import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_algo_studio/domain/entity/task.dart';

part 'task_event.freezed.dart';

@freezed
class TaskEvent with _$TaskEvent {
  const factory TaskEvent.get() = Get;

  const factory TaskEvent.add(Task task) = Add;

  const factory TaskEvent.update(Task task) = Update;

  const factory TaskEvent.delete(Task task) = Delete;

  const factory TaskEvent.clearPreviousValue() = ClearPreviousValue;

  const factory TaskEvent.updateTaskTitle(String title) = UpdateTaskTitle;

  const factory TaskEvent.updateTaskDescription(String description) =
      UpdateTaskDescription;

  const factory TaskEvent.updateTaskDate(DateTime date) = UpdateTaskDate;

  const factory TaskEvent.updateTaskTime(DateTime? time) = UpdateTaskTime;
}
