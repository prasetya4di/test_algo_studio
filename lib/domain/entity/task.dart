class Task {
  final int? id;
  final String title;
  final String description;
  final DateTime date;
  final bool useTime;
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