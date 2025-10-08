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
              mainAxisSize: MainAxisSize.min,
              children: [
                _CancelTasksButton(selectionState: selectionState),
                const SizedBox(width: 8),
                _DeleteTasksButton(selectionState: selectionState), // ⚡
              ],
            )
          : const _NewTaskButton(),
    );
  }
}

class _CancelTasksButton extends ConsumerWidget {
  const _CancelTasksButton({
    required this.selectionState,
  });

  final Set<String> selectionState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton.extended(
      onPressed: () {
        final showCanceled = ref.read(
          tasksFiltersNotifier.select((state) => state.canceled == null),
        );
        final selectionNotifier = ref.read(
          itemSelectionNotifierProvider.notifier,
        );
        unawaited(
          ref
              .read(tasksRepositoryProvider)
              .cancelMultipleTasks(selectionState, showCanceled: showCanceled),
        );
        selectionNotifier.removeAll();
      },
      icon: const Icon(Icons.cancel_outlined),
      label: Text(t.tasks.list.cancelButton),
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
          title: t.common.dialog.deleteTitle,
          content: t.tasks.list.deleteDialog.content(n: selectedCount),
          confirm: t.common.dialog.deleteButton,
          dangerous: true,
        );
        if (confirm ?? false) {
          final selectionNotifier = ref.read(
            itemSelectionNotifierProvider.notifier,
          );
          unawaited(
            ref
                .read(tasksRepositoryProvider)
                .deleteMultipleTasks(selectionState),
          );
          selectionNotifier.removeAll();
        }
      },
      tooltip: t.tasks.list.tooltips.deleteSelectedButton,
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
      tooltip: t.tasks.list.tooltips.addNewButton,
      child: const Icon(Icons.add_task_rounded),
    );
  }
}
