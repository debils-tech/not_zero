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
            state.searchTags.isNotEmpty,
      ),
    );

    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: .center,
      children: [
        const SizedBox(height: 24),
        Text(
          context.t.tasks.list.empty.icon,
          style: theme.textTheme.displayLarge?.copyWith(fontSize: 48),
        ),
        const SizedBox(height: 16),
        Text(
          hasFilters
              ? context.t.tasks.list.empty.titleFilters
              : context.t.tasks.list.empty.title,
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
                ? context.t.tasks.list.empty.buttonFilters
                : context.t.tasks.list.empty.button,
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
