import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/units/tags/presentation/view/tag_list_indicator.dart';
import 'package:not_zero/units/tasks/presentation/bloc/task_view_cubit.dart';
import 'package:not_zero/units/tasks/presentation/view/components/task_editing_info.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';
import 'package:nz_tasks_models/nz_tasks_models.dart';

class TaskViewScreen extends StatelessWidget {
  const TaskViewScreen({required this.taskToView, super.key});

  final Task taskToView;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<TaskViewCubit>()..init(taskToView.id),
      child: Scaffold(
        appBar: AppBar(
          title: Text(t.tasks.view.title),
          bottom: _TaskViewImportanceIndicator(taskToView),
        ),
        body: _TaskViewScreenBody(taskToView),
        floatingActionButton: _EditFloatingButton(taskToView),
      ),
    );
  }
}

class _TaskViewImportanceIndicator extends StatelessWidget
    implements PreferredSizeWidget {
  const _TaskViewImportanceIndicator(this.task);

  final Task task;

  @override
  Size get preferredSize => const Size.fromHeight(8);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(height: preferredSize.height),
      child: ColoredBox(
        color: _colorByImportance(
          task.importance,
          Theme.of(context).tasksColorScheme,
        ),
      ),
    );
  }

  Color _colorByImportance(
    TaskImportance importance,
    TasksColorScheme colorScheme,
  ) =>
      switch (importance) {
        TaskImportance.notImportant => colorScheme.notImportantColor,
        TaskImportance.normal => colorScheme.normalColor,
        TaskImportance.important => colorScheme.importantColor,
      };
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
          padding: const EdgeInsets.only(top: 7, bottom: 75, left: 7, right: 7),
          children: [
            TagListIndicator(
              tags: task.tags,
              fontSize: 13,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            const SizedBox(height: 8),
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
      onPressed: () => context.pushReplacement(
        '/tasks/edit/${taskToView.id}',
        extra: context.read<TaskViewCubit>().state ?? taskToView,
      ),
      tooltip: t.tasks.view.tooltips.editTaskButton,
      child: const Icon(Icons.edit_rounded),
    );
  }
}
