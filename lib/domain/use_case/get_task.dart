import 'package:test_algo_studio/domain/entity/task_group.dart';

abstract class GetTask {
  Future<List<TaskGroup>> call();
}