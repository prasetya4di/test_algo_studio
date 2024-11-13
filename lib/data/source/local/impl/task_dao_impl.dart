import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:test_algo_studio/data/source/local/task_dao.dart';
import 'package:test_algo_studio/domain/entity/task.dart';
import 'package:test_algo_studio/domain/entity/task_group.dart';

class TaskDaoImpl implements TaskDao {
  static const _boxName = 'tasks';

  @override
  Future<void> delete(Task task) async {
    final box = await Hive.openBox<Task>(_boxName);
    await box.delete(task.id);
    await box.close();
  }

  @override
  Future<List<TaskGroup>> get() async {
    Map<DateTime, List<Task>> tasks = {};
    final box = await Hive.openBox<Task>(_boxName);
    for (final key in box.keys) {
      final data = box.get(key);
      final dateKey = DateTime(data!.date.year, data.date.month, data.date.day);
      if (tasks.containsKey(dateKey)) {
        tasks[dateKey]!.add(data);
      } else {
        tasks[dateKey] = [data];
      }
    }
    await box.close();
    return tasks.keys
        .map((key) => TaskGroup(date: key, tasks: tasks[key]!))
        .toList();
  }

  @override
  Future<Task> insert(Task task) async {
    final box = await Hive.openBox<Task>(_boxName);
    int key = 0;
    if (box.isNotEmpty) {
      key = box.keys
              .cast<int>()
              .reduce((value, element) => value > element ? value : element) +
          1;
    }
    final newTaskWithId = task.copyWith(id: key);
    await box.add(task.copyWith(id: key));
    await box.close();
    return newTaskWithId;
  }

  @override
  Future<void> update(Task task) async {
    final box = await Hive.openBox<Task>(_boxName);
    await box.put(task.id, task);
    await box.close();
  }
}

final taskDaoProvider = Provider.autoDispose<TaskDao>((ref) => TaskDaoImpl());
