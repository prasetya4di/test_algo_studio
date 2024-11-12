import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Task'),
      ),
      body: Center(
        child: Text('Add Task Screen'),
      ),
    );
  }
}