import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_algo_studio/presentation/screen/add_task/widgets/add_task_form.dart';
import 'package:test_algo_studio/presentation/screen/add_task/widgets/cancel_button.dart';
import 'package:test_algo_studio/presentation/screen/add_task/widgets/save_button.dart';

@RoutePage()
class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Task'),
      ),
      body: Form(
        key: _formKey,
        child: const SingleChildScrollView(
          padding: EdgeInsets.all(12),
          child: AddTaskForm(),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Row(
            children: [
              CancelButton(onPressed: () {
                context.maybePop();
              }),
              const SizedBox(width: 12),
              SaveButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    context.maybePop();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
