import 'package:easy_sticky_header/easy_sticky_header.dart';
import 'package:flutter/material.dart';
import 'package:test_algo_studio/domain/entity/task_group.dart';
import 'package:test_algo_studio/presentation/screen/task/widget/task_date_header.dart';
import 'package:test_algo_studio/presentation/screen/task/widget/task_item.dart';

class ListTask extends StatelessWidget {
  final List<TaskGroup> tasks;

  const ListTask({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return StickyHeader(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final data = tasks[index];
          return Column(
            children: [
              StickyContainerWidget(
                index: index,
                child: TaskDateHeader(date: data.date),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                primary: false,
                itemCount: data.tasks.length,
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemBuilder: (context, index) {
                  final task = data.tasks[index];
                  return TaskItem(key: Key("${task.id ?? index}"), task: task);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
