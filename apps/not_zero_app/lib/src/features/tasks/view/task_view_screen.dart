// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2025 Nagorny Vladislav
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero_app/src/features/tags/view/tag_list_indicator.dart';
import 'package:not_zero_app/src/features/tasks/di.dart';
import 'package:not_zero_app/src/features/tasks/view/components/task_editing_info.dart';
import 'package:not_zero_app/src/features/themes/extensions/tasks_colors.dart';
import 'package:not_zero_app/src/features/translations/translations.g.dart';
import 'package:not_zero_app/src/helpers/build_context_quick_access_ext.dart';
import 'package:nz_base_models/nz_base_models.dart';

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
