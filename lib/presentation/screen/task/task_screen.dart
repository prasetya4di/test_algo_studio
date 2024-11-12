import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
      ),
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}