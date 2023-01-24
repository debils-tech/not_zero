import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/i18n/translations.g.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:not_zero/units/tasks/presentation/bloc/task_view_cubit.dart';
import 'package:not_zero/units/tasks/presentation/view/components/task_editing_info.dart';

class TaskViewScreen extends StatelessWidget {
  const TaskViewScreen({required this.taskToView, super.key});

  final Task taskToView;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<TaskViewCubit>()..init(taskToView.id),
      child: Scaffold(
        // TODO(uSlashVlad): Change to slang localization
        appBar: AppBar(title: Text(t.tasks.view.title)),
        body: _TaskViewScreenBody(taskToView),
        floatingActionButton: _EditFloatingButton(taskToView),
      ),
    );
  }
}

class _TaskViewScreenBody extends StatelessWidget {
  const _TaskViewScreenBody(this.taskToView);

  final Task taskToView;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<TaskViewCubit, Task?>(
      builder: (context, state) {
        final task = state ?? taskToView;

        return ListView(
          padding: const EdgeInsets.only(top: 5, bottom: 75, left: 7, right: 7),
          children: [
            SelectableText(
              task.title,
              style: theme.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            if (task.description.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SelectableText(task.description),
              ),
            const SizedBox(height: 10),
            TaskEditingInfo(task),
          ],
        );
      },
    );
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
        extra: context.read<TaskViewCubit>().state ?? taskToView,
      ),
      tooltip: t.tasks.view.tooltips.editTaskButton,
      child: const Icon(Icons.edit_rounded),
    );
  }
}
