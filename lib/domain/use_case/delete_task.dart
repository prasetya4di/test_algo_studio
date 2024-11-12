import 'package:test_algo_studio/domain/entity/task.dart';

abstract class DeleteTask {
  Future<void> call(Task task);
}