import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero_app/src/features/tags/view/tag_list_indicator.dart';
import 'package:not_zero_app/src/features/tasks/di.dart';
import 'package:not_zero_app/src/features/tasks/view/components/task_editing_info.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class TaskViewScreen extends ConsumerWidget {
  const TaskViewScreen({required this.taskToView, super.key});

  final Task taskToView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.tasks.view.title),
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
  Size get preferredSize => const .fromHeight(8);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: .expand(height: preferredSize.height),
      child: ColoredBox(
        color: _colorByImportance(
          task.importance,
          context.theme.tasksColorScheme,
        ),
      ),
    );
  }

  Color _colorByImportance(
    TaskImportance importance,
    TasksColorScheme colorScheme,
  ) => switch (importance) {
    .notImportant => colorScheme.notImportantColor,
    .normal => colorScheme.normalColor,
    .important => colorScheme.importantColor,
  };
}

class _TaskViewScreenBody extends ConsumerWidget {
  const _TaskViewScreenBody(this.taskToView);

  final Task taskToView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final task =
        ref.watch(specificTaskStreamProvider(taskToView.id)).value ??
        taskToView;

    return ListView(
      padding: const .only(top: 7, bottom: 75, left: 7, right: 7),
      children: [
        TagListIndicator(
          tags: task.tags,
          fontSize: 13,
          borderRadius: const .all(.circular(12)),
        ),
        GestureDetector(
          onTap: () => context.pushReplacement(
            '/tasks/edit/${taskToView.id}',
            extra: taskToView,
          ),
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              const SizedBox(height: 8),
              Text(
                task.title,
                style: context.theme.textTheme.titleLarge?.copyWith(
                  fontWeight: .w700,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        if (task.description.isNotEmpty)
          Padding(
            padding: const .symmetric(horizontal: 8),
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
      tooltip: context.t.tasks.view.tooltips.editTaskButton,
      child: const Icon(Icons.edit_rounded),
    );
  }
}
