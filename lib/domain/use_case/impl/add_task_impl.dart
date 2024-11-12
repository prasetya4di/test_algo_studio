import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_algo_studio/data/repository/task_repository_impl.dart';
import 'package:test_algo_studio/domain/entity/task.dart';
import 'package:test_algo_studio/domain/repository/task_repository.dart';
import 'package:test_algo_studio/domain/use_case/add_task.dart';

class AddTaskImpl implements AddTask {
  final TaskRepository taskRepository;

  AddTaskImpl(this.taskRepository);

  @override
  Future<Task> call(Task task) async {
    return await taskRepository.insert(task);
  }
}

final addTaskProvider = Provider.autoDispose<AddTask>(
  (ref) => AddTaskImpl(ref.read(taskRepositoryProvider)),
);