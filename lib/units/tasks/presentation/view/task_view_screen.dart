import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';

class TaskViewScreen extends StatelessWidget {
  const TaskViewScreen({required this.taskToView, super.key});

  final Task taskToView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO Change to slang localization
      appBar: AppBar(title: const Text('Text View')),
      body: _TaskViewScreenBody(taskToView),
      floatingActionButton: _EditFloatingButton(taskToView),
    );
  }
}

class _TaskViewScreenBody extends StatelessWidget {
  const _TaskViewScreenBody(this.taskToView);

  final Task taskToView;

  @override
  Widget build(BuildContext context) {
    return ListView();
  }
}

class _EditFloatingButton extends StatelessWidget {
  const _EditFloatingButton(this.taskToView);

  final Task taskToView;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => GoRouter.of(context).push(
        '/tasks/edit/${taskToView.id}',
        extra: taskToView,
      ),
      child: const Icon(Icons.edit_rounded),
    );
  }
}
