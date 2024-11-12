import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_algo_studio/presentation/router/app_router.gr.dart';

class NewTaskButton extends StatelessWidget {
  const NewTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        iconColor: Colors.white,
      ),
      onPressed: () {
        context.pushRoute(const AddTaskRoute());
      },
      child: Row(
        children: [
          const Icon(Icons.add),
          const SizedBox(width: 4),
          Text(
            'New Task',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}