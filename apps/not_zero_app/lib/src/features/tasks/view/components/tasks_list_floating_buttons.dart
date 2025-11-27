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

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero_app/src/features/tasks/di.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class TasksListFloatingButtons extends ConsumerWidget {
  const TasksListFloatingButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectionState = ref.watch(itemSelectionNotifierProvider);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      child: selectionState.isNotEmpty
          ? Row(
              mainAxisSize: .min,
              children: [
                const SizedBox(width: 8),
                _DeleteTasksButton(selectionState: selectionState), // ⚡
              ],
            )
          : const _NewTaskButton(),
    );
  }
}

class _DeleteTasksButton extends ConsumerWidget {
  const _DeleteTasksButton({
    required this.selectionState,
  });

  final Set<String> selectionState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return FloatingActionButton(
      foregroundColor: theme.colorScheme.onError,
      backgroundColor: theme.colorScheme.error,
      onPressed: () async {
        final selectedCount = ref.read(itemSelectionNotifierProvider).length;

        final confirm = await showConfirmationDialog(
          context,
          title: context.t.common.dialog.deleteTitle,
          content: context.t.tasks.list.deleteDialog.content(n: selectedCount),
          confirm: context.t.common.dialog.deleteButton,
          dangerous: true,
        );
        if (confirm ?? false) {
          final selectionNotifier = ref.read(
            itemSelectionNotifierProvider.notifier,
          );
          unawaited(
            ref
                .read(tasksMainListNotifier.notifier)
                .deleteMultipleTasks(selectionState),
          );
          selectionNotifier.removeAll();
        }
      },
      tooltip: context.t.tasks.list.tooltips.deleteSelectedButton,
      child: const Icon(Icons.delete_outline_rounded),
    );
  }
}

class _NewTaskButton extends StatelessWidget {
  const _NewTaskButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context.push('/tasks/new'),
      tooltip: context.t.tasks.list.tooltips.addNewButton,
      child: const Icon(Icons.add_task_rounded),
    );
  }
}
