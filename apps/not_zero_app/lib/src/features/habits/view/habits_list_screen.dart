import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/habits/di.dart';
import 'package:not_zero_app/src/features/habits/view/components/habit_card.dart';
import 'package:not_zero_app/src/features/habits/view/components/habits_list_app_bar.dart';
import 'package:not_zero_app/src/features/habits/view/components/habits_list_floating_buttons.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class HabitsListScreen extends StatelessWidget {
  const HabitsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        itemSelectionNotifierProvider.overrideWith(ItemSelectionNotifier.new),
      ],
      child: const Scaffold(
        appBar: HabitsListAppBar(),
        floatingActionButton: HabitsListFloatingButtons(),
        body: _TasksListScreenBody(),
      ),
    );
  }
}

class _TasksListScreenBody extends ConsumerWidget {
  const _TasksListScreenBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(habitsListNotifierProvider);

    final hasSelection = ref.watch(
      itemSelectionNotifierProvider.select((selection) => selection.isNotEmpty),
    );

    return PopScope(
      canPop: !hasSelection,
      child: switch (state) {
        AsyncData(value: final habits) => _HabitsListView(habits),
        AsyncLoading() => const _HabitsLoadingView(),
        AsyncError(:final error, :final stackTrace) => EverythingBrokeText(
          error,
          stackTrace,
        ),
      },
    );
  }
}

class _HabitsLoadingView extends StatelessWidget {
  const _HabitsLoadingView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _HabitsListView extends StatelessWidget {
  const _HabitsListView(this.habits);

  final List<Habit> habits;

  @override
  Widget build(BuildContext context) {
    return AdaptiveListLimiter(
      maxWidth: 600,
      child: ListView(
        padding: const EdgeInsets.only(top: 5, bottom: 75, left: 10, right: 10),
        children: [
          ...habits.map(
            (h) => HabitCard(
              h,
              key: Key('Habit ${h.id}'),
            ),
          ),
        ],
      ),
    );
  }
}
