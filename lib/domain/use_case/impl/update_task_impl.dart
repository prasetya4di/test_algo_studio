import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_algo_studio/data/repository/task_repository_impl.dart';
import 'package:test_algo_studio/domain/entity/task.dart';
import 'package:test_algo_studio/domain/repository/task_repository.dart';
import 'package:test_algo_studio/domain/use_case/update_task.dart';

class UpdateTaskImpl implements UpdateTask {
  final TaskRepository taskRepository;

  UpdateTaskImpl(this.taskRepository);

  @override
  Future<void> call(Task task) async {
    await taskRepository.update(task);
  }
}

final updateTaskProvider = Provider.autoDispose<UpdateTask>(
      (ref) => UpdateTaskImpl(ref.read(taskRepositoryProvider)),
);