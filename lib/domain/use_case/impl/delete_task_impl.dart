import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_algo_studio/data/repository/task_repository_impl.dart';
import 'package:test_algo_studio/domain/entity/task.dart';
import 'package:test_algo_studio/domain/repository/task_repository.dart';
import 'package:test_algo_studio/domain/use_case/delete_task.dart';

class DeleteTaskImpl implements DeleteTask {
  final TaskRepository taskRepository;

  DeleteTaskImpl(this.taskRepository);

  @override
  Future<void> call(Task task) async {
    return await taskRepository.delete(task);
  }
}

final deleteTaskProvider = Provider.autoDispose<DeleteTask>(
      (ref) => DeleteTaskImpl(ref.read(taskRepositoryProvider)),
);