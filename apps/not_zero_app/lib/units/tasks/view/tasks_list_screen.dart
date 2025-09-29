import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero_app/components/adaptive/list_limiter.dart';
import 'package:not_zero_app/components/common_widgets/date_range_switch.dart';
import 'package:not_zero_app/components/confirmation_dialog.dart';
import 'package:not_zero_app/components/selection/di.dart';
import 'package:not_zero_app/components/selection/notifiers/item_selection_notifier.dart';
import 'package:not_zero_app/units/tags/view/tag_selector.dart';
import 'package:not_zero_app/units/tasks/di.dart';
import 'package:not_zero_app/units/tasks/view/components/task_card.dart';
import 'package:not_zero_app/units/tasks/view/components/tasks_list_app_bar.dart';
import 'package:nz_common/nz_common.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';
import 'package:nz_base_models/nz_base_models.dart';

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
        floatingActionButton: _TasksListFloatingButton(),
      ),
    );
  }
}

class _TasksListFloatingButton extends ConsumerWidget {
  const _TasksListFloatingButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectionState = ref.watch(itemSelectionNotifierProvider);

    if (selectionState.isNotEmpty) {
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
            final notifier = ref.read(itemSelectionNotifierProvider.notifier);
            unawaited(
              ref
                  .read(tasksRepositoryProvider)
                  .deleteMultipleTasks(selectionState),
            );
            notifier.removeAll();
          }
        },
        tooltip: t.tasks.list.tooltips.deleteSelectedButton,
        child: const Icon(Icons.delete_outline_rounded),
      );
    }

    return FloatingActionButton(
      onPressed: () => context.push('/tasks/new'),
      tooltip: t.tasks.list.tooltips.addNewButton,
      child: const Icon(Icons.add_task_rounded),
    );
  }
}

class _TasksListScreenBody extends ConsumerWidget {
  const _TasksListScreenBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(tasksListStreamProvider);

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
          ...tasks.map(
            (t) => TaskCard(
              t,
              key: Key('Task ${t.id}'),
            ),
          ),
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
