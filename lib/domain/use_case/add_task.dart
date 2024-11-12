import 'package:test_algo_studio/domain/entity/task.dart';

abstract class AddTask {
  Future<Task> call(Task task);
}