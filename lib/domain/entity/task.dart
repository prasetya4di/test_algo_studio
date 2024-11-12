import 'package:hive_flutter/hive_flutter.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final DateTime date;
  @HiveField(4)
  final bool useTime;
  @HiveField(5)
  final bool isComplete;

  Task({
    this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.useTime,
    required this.isComplete,
  });

  Task copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? date,
    bool? useTime,
    bool? isComplete,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      useTime: useTime ?? this.useTime,
      isComplete: isComplete ?? this.isComplete,
    );
  }
}