import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero_app/src/features/tasks/di.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class TasksEmptyListPlaceholder extends ConsumerWidget {
  const TasksEmptyListPlaceholder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasFilters = ref.watch(
      tasksFiltersNotifier.select(
        (state) =>
            state.someday ||
            (state.canceled ?? false) ||
            (state.completed ?? false) ||
            state.searchTags.isNotEmpty,
      ),
    );

    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 24),
        Text(
          t.tasks.list.empty.icon,
          style: theme.textTheme.displayLarge?.copyWith(fontSize: 48),
        ),
        const SizedBox(height: 16),
        Text(
          hasFilters
              ? t.tasks.list.empty.titleFilters
              : t.tasks.list.empty.title,
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () {
            if (hasFilters) {
              ref.read(tasksFiltersNotifier.notifier).resetFilters();
            } else {
              context.go('/tasks/new');
            }
          },
          child: Text(
            hasFilters
                ? t.tasks.list.empty.buttonFilters
                : t.tasks.list.empty.button,
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
