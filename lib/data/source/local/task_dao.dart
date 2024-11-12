import 'package:test_algo_studio/domain/entity/task.dart';
import 'package:test_algo_studio/domain/entity/task_group.dart';

abstract class TaskDao {
  Future<void> insert(Task task);

  Future<List<TaskGroup>> get();

  Future<void> update(Task task);

  Future<void> delete();
}