import 'package:test_algo_studio/domain/entity/task.dart';

class TaskGroup {
  final DateTime date;
  final List<Task> tasks;

  TaskGroup({
    required this.date,
    required this.tasks,
  });

  TaskGroup copyWith({
    DateTime? date,
    List<Task>? tasks,
  }) {
    return TaskGroup(
      date: date ?? this.date,
      tasks: tasks ?? this.tasks,
    );
  }
}