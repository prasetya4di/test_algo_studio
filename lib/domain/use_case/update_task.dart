import 'package:test_algo_studio/domain/entity/task.dart';

abstract class UpdateTask {
  Future<Task> call(Task task);
}