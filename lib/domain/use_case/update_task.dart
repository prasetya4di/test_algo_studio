import 'package:test_algo_studio/domain/entity/task.dart';

abstract class UpdateTask {
  Future<void> call(Task task);
}