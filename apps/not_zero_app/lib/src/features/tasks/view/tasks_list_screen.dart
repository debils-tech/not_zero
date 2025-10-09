import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/tags/view/tag_selector.dart';
import 'package:not_zero_app/src/features/tasks/di.dart';
import 'package:not_zero_app/src/features/tasks/view/components/task_card.dart';
import 'package:not_zero_app/src/features/tasks/view/components/tasks_empty_list_placeholder.dart';
import 'package:not_zero_app/src/features/tasks/view/components/tasks_list_app_bar.dart';
import 'package:not_zero_app/src/features/tasks/view/components/tasks_list_floating_buttons.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_common/nz_common.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

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
        body: _TasksListScreenBody(),
        floatingActionButton: TasksListFloatingButtons(),
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

    return PopScope(
      canPop: !hasSelection,
      onPopInvokedWithResult: (canPop, _) {
        if (!canPop) {
          final selectionNotifier = ref.read(
            itemSelectionNotifierProvider.notifier,
          );
          selectionNotifier.removeAll();
        }
      },
      child: switch (state) {
        AsyncData(value: final tasks) => _TasksListView(tasks),
        _ => const _TasksLoadingView(),
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
        padding: const EdgeInsets.only(top: 5, bottom: 75, left: 10, right: 10),
        children: [
          const _TasksFilters(),
          if (tasks.isNotEmpty)
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
    final selectedTags = ref.watch(
      tasksFiltersNotifier.select((state) => state.searchTags),
    );

    return Column(
      children: [
        DateRangeSwitch(
          rangeType: DateRangeType.day,
          initialDate: selectedDay,
          onChanged: (startDay, endDay) {
            assert(startDay.isAtSameDay(endDay), 'Invalid date range');
            if (selectedDay?.isAtSameDay(endDay) ?? false) return;

            filtersNotifier.selectDay(endDay);
          },
        ),
        const SizedBox(height: 8),
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
      ],
    );
  }
}
