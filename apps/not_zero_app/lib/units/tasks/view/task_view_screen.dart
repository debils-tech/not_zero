import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero_app/units/tags/view/tag_list_indicator.dart';
import 'package:not_zero_app/units/tasks/di.dart';
import 'package:not_zero_app/units/tasks/view/components/task_editing_info.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';
import 'package:nz_base_models/nz_base_models.dart';

class TaskViewScreen extends ConsumerWidget {
  const TaskViewScreen({required this.taskToView, super.key});

  final Task taskToView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.tasks.view.title),
        bottom: _TaskViewImportanceIndicator(taskToView),
      ),
      body: _TaskViewScreenBody(taskToView),
      floatingActionButton: _EditFloatingButton(taskToView),
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
  ) => switch (importance) {
    TaskImportance.notImportant => colorScheme.notImportantColor,
    TaskImportance.normal => colorScheme.normalColor,
    TaskImportance.important => colorScheme.importantColor,
  };
}

class _TaskViewScreenBody extends ConsumerWidget {
  const _TaskViewScreenBody(this.taskToView);

  final Task taskToView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final task =
        ref.watch(specificTaskStreamProvider(taskToView.id)).value ??
        taskToView;

    return ListView(
      padding: const EdgeInsets.only(top: 7, bottom: 75, left: 7, right: 7),
      children: [
        TagListIndicator(
          tags: task.tags,
          fontSize: 13,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        GestureDetector(
          onTap: () => context.pushReplacement(
            '/tasks/edit/${taskToView.id}',
            extra: taskToView,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),
              Text(
                task.title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        if (task.description.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SelectableText(task.description),
          ),
        const SizedBox(height: 10),
        TaskEditingInfo(task),
      ],
    );
  }
}

class _EditFloatingButton extends ConsumerWidget {
  const _EditFloatingButton(this.taskToView);

  final Task taskToView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () => context.pushReplacement(
        '/tasks/edit/${taskToView.id}',
        extra: taskToView,
      ),
      tooltip: t.tasks.view.tooltips.editTaskButton,
      child: const Icon(Icons.edit_rounded),
    );
  }
}
