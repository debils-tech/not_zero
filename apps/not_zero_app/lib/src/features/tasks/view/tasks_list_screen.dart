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
import 'package:not_zero_app/src/features/common/view/components/adaptive/list_limiter.dart';
import 'package:not_zero_app/src/features/common/view/components/common_widgets/date_range_switch.dart';
import 'package:not_zero_app/src/features/common/view/components/common_widgets/everything_broke_text.dart';
import 'package:not_zero_app/src/features/common/view/components/selection/di.dart';
import 'package:not_zero_app/src/features/common/view/components/selection/notifiers/item_selection_notifier.dart';
import 'package:not_zero_app/src/features/tags/view/tag_selector.dart';
import 'package:not_zero_app/src/features/tasks/di.dart';
import 'package:not_zero_app/src/features/tasks/view/components/task_card.dart';
import 'package:not_zero_app/src/features/tasks/view/components/tasks_empty_list_placeholder.dart';
import 'package:not_zero_app/src/features/tasks/view/components/tasks_list_app_bar.dart';
import 'package:not_zero_app/src/features/tasks/view/components/tasks_list_floating_buttons.dart';
import 'package:not_zero_app/src/features/translations/translations.g.dart';
import 'package:not_zero_app/src/helpers/build_context_quick_access_ext.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_common/nz_common.dart';

class TasksListScreen extends ConsumerWidget {
  const TasksListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        itemSelectionNotifierProvider.overrideWith(ItemSelectionNotifier.new),
      ],
      child: const Scaffold(
        appBar: TasksListAppBar(),
        floatingActionButton: TasksListFloatingButtons(),
        body: _TasksListScreenBody(),
      ),
    );
  }
}

class _TasksListScreenBody extends ConsumerWidget {
  const _TasksListScreenBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(tasksMainListNotifier);

    final hasSelection = ref.watch(
      itemSelectionNotifierProvider.select((selection) => selection.isNotEmpty),
    );
    final somedayFilter = ref.watch(
      tasksFiltersNotifier.select((filters) => filters.someday),
    );

    return PopScope(
      canPop: !hasSelection && !somedayFilter,
      onPopInvokedWithResult: (canPop, _) {
        if (canPop) return;

        if (hasSelection) {
          final selectionNotifier = ref.read(
            itemSelectionNotifierProvider.notifier,
          );
          selectionNotifier.removeAll();
        } else if (somedayFilter) {
          final filtersNotifier = ref.read(tasksFiltersNotifier.notifier);
          filtersNotifier.toggleSomeday();
        }
      },
      child: switch (state) {
        AsyncData(value: final tasks) => _TasksListView(tasks),
        AsyncLoading() => const _TasksLoadingView(),
        AsyncError(:final error, :final stackTrace) => EverythingBrokeText(
          error,
          stackTrace,
        ),
      },
    );
  }
}

class _TasksLoadingView extends StatelessWidget {
  const _TasksLoadingView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _TasksListView extends StatelessWidget {
  const _TasksListView(this.tasks);

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return AdaptiveListLimiter(
      maxWidth: 600,
      child: ListView(
        padding: const .only(top: 5, bottom: 75, left: 10, right: 10),
        children: [
          const _TasksFilters(),
          ...tasks.map(
            (t) => TaskCard(
              t,
              key: Key('Task ${t.id}'),
            ),
          ),
          if (tasks.isEmpty) const TasksEmptyListPlaceholder(),
        ],
      ),
    );
  }
}

class _TasksFilters extends ConsumerWidget {
  const _TasksFilters();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filtersNotifier = ref.watch(tasksFiltersNotifier.notifier);
    final selectedDay = ref.watch(
      tasksFiltersNotifier.select((state) => state.forDate),
    );
    final isSomeday = ref.watch(
      tasksFiltersNotifier.select((state) => state.someday),
    );
    final selectedTags = ref.watch(
      tasksFiltersNotifier.select((state) => state.searchTags),
    );
    final (allTasksCount, tasksLeftToComplete) = ref.watch(
      tasksMainListNotifier.select(
        (state) => (
          state.value?.length,
          state.value?.where((task) => !task.isCompleted).length,
        ),
      ),
    );

    return Column(
      crossAxisAlignment: .start,
      children: [
        if (!isSomeday) ...[
          DateRangeSwitch(
            rangeType: .day,
            initialDate: selectedDay,
            onChanged: (startDay, endDay) {
              assert(startDay.isAtSameDay(endDay), 'Invalid date range');
              if (selectedDay.isAtSameDay(endDay)) return;

              filtersNotifier.selectDay(endDay);
            },
          ),
          const SizedBox(height: 8),
        ],
        ItemTagSelector(
          selectedTags: selectedTags,
          onSelection: (tag, isSelected) {
            if (isSelected) {
              filtersNotifier.selectTag(tag);
            } else {
              filtersNotifier.unSelectTag(tag);
            }
          },
          showAddButton: false,
        ),
        const SizedBox(height: 10),
        if (tasksLeftToComplete != null &&
            allTasksCount != null &&
            allTasksCount > 0) ...[
          Text(
            context.t.tasks.list.tasksLeftToComplete(n: tasksLeftToComplete),
            style: context.theme.textTheme.labelMedium,
          ),
          const SizedBox(height: 8),
        ],
      ],
    );
  }
}
