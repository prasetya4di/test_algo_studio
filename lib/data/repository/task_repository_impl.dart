import 'package:test_algo_studio/data/source/local/task_dao.dart';
import 'package:test_algo_studio/domain/entity/task.dart';
import 'package:test_algo_studio/domain/entity/task_group.dart';
import 'package:test_algo_studio/domain/repository/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskDao taskDao;

  TaskRepositoryImpl(this.taskDao);

  @override
  Future<void> delete(Task task) async {
    await taskDao.delete();
  }

  @override
  Future<List<TaskGroup>> get() async {
    return await taskDao.get();
  }

  @override
  Future<Task> insert(Task task) async {
    return await taskDao.insert(task);
  }

  @override
  Future<void> update(Task task) async {
    await taskDao.update(task);
  }
}