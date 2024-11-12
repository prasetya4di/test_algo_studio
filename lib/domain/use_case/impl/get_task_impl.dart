import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_algo_studio/data/repository/task_repository_impl.dart';
import 'package:test_algo_studio/domain/entity/task_group.dart';
import 'package:test_algo_studio/domain/repository/task_repository.dart';
import 'package:test_algo_studio/domain/use_case/get_task.dart';

class GetTaskImpl implements GetTask {
  final TaskRepository taskRepository;

  GetTaskImpl(this.taskRepository);

  @override
  Future<List<TaskGroup>> call() async {
    return await taskRepository.get();
  }
}

final getTaskProvider = Provider.autoDispose<GetTask>(
      (ref) => GetTaskImpl(ref.read(taskRepositoryProvider)),
);