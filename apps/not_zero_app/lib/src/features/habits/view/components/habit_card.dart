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
import 'package:intl/intl.dart';
import 'package:not_zero_app/src/features/habits/di.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_common/nz_common.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class HabitCard extends ConsumerWidget {
  const HabitCard(
    this.habit, {
    super.key,
  });

  final Habit habit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentCompletion = ref.watch(
      habitCompletionsWeekHistoryNotifierProvider(
        habit,
      ).select(
        (state) => switch (state) {
          AsyncData(:final value) => value.lastOrNull?.$2,
          _ => null,
        },
      ),
    );
    final repository = ref.watch(habitsRepositoryProvider);

    return SelectableCard(
      onTap: () {
        if (currentCompletion != null) {
          unawaited(
            repository.deleteHabitCompletion(
              habit: habit,
              completion: currentCompletion,
            ),
          );
          return;
        }

        unawaited(
          repository.addHabitCompletion(
            habit: habit,
            completion: HabitCompletion.create(
              habitId: habit.id,
              completedDate: DateTime.now(),
            ),
          ),
        );
      },
      identifier: habit.id,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: switch (currentCompletion?.type) {
            .completed => context.theme.colorScheme.primaryContainer.withAlpha(
              200,
            ),
            .skipped => context.theme.colorScheme.primaryContainer.withAlpha(
              120,
            ),
            _ => null,
          },
        ),
        child: _ImportanceIndicatorBox(
          importance: habit.importance,
          child: Padding(
            padding: const .only(left: 15, right: 12, top: 4, bottom: 8),
            child: AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Column(
                crossAxisAlignment: .stretch,
                spacing: 8,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _HabitTextBlock(habit: habit),
                      ),
                      IconButton(
                        onPressed: () => context.push(
                          '/habits/view/${habit.id}',
                          extra: habit,
                        ),
                        tooltip: context.t.habits.list.tooltips.viewHabitButton,
                        icon: const Icon(Icons.chevron_right_rounded),
                      ),
                    ],
                  ),
                  _HabitCompletionsHistory(habit: habit),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HabitTextBlock extends StatelessWidget {
  const _HabitTextBlock({required this.habit});

  final Habit habit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          habit.title,
          overflow: .ellipsis,
          maxLines: 3,
          style: context.theme.textTheme.titleMedium?.copyWith(
            fontWeight: .w600,
          ),
        ),
        const SizedBox(height: 4),
        if (habit.description.isNotEmpty)
          Padding(
            padding: const .symmetric(
              horizontal: 4,
            ),
            child: Text(
              habit.description,
              style: context.theme.textTheme.bodySmall?.copyWith(
                fontWeight: .w500,
              ),
              overflow: .ellipsis,
              maxLines: 4,
            ),
          ),
      ],
    );
  }
}

class _ImportanceIndicatorBox extends StatelessWidget {
  const _ImportanceIndicatorBox({
    required this.importance,
    required this.child,
  });

  final TaskImportance importance;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            width: 7,
            color: _colorByImportance(
              importance,
              context.theme.tasksColorScheme,
            ),
          ),
        ),
      ),
      child: child,
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

class _HabitCompletionsHistory extends ConsumerWidget {
  const _HabitCompletionsHistory({required this.habit});

  final Habit habit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history = ref.watch(
      habitCompletionsWeekHistoryNotifierProvider(habit),
    );

    return switch (history) {
      AsyncData(:final value) => Row(
        spacing: 4,
        children: value
            .map(
              (pair) => _HabitCompletionDay(
                habit: habit,
                date: pair.$1,
                completion: pair.$2,
              ),
            )
            .toList(),
      ),
      _ => const SizedBox.shrink(),
    };
  }
}

class _HabitCompletionDay extends ConsumerWidget {
  const _HabitCompletionDay({
    required this.habit,
    required this.date,
    required this.completion,
  });

  final Habit habit;
  final DateTime date;
  final HabitCompletion? completion;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const radius = BorderRadius.all(Radius.circular(8));
    final weekday = DateFormat(
      DateFormat.ABBR_WEEKDAY,
    ).format(date).toUpperCase();

    final currentCompletion = completion;
    final isBlocked =
        date.isBefore(habit.createdAt.startOfDay) ||
        date.isAfter(DateTime.now().endOfDay);

    final repository = ref.watch(habitsRepositoryProvider);

    final buttonDecoration = switch (currentCompletion?.type) {
      .completed => BoxDecoration(
        borderRadius: radius,
        color: context.theme.colorScheme.primaryContainer,
        border: .fromBorderSide(
          BorderSide(
            color: context.theme.colorScheme.primary,
          ),
        ),
      ),
      .skipped => BoxDecoration(
        borderRadius: radius,
        gradient: _strippedGradient(context.theme.colorScheme.primaryContainer),
        border: .fromBorderSide(
          BorderSide(
            color: context.theme.colorScheme.primary.withAlpha(127),
          ),
        ),
      ),
      _ => BoxDecoration(
        borderRadius: radius,
        border: .fromBorderSide(
          BorderSide(
            color: context.theme.colorScheme.surfaceContainerHighest,
          ),
        ),
      ),
    };

    final child = Column(
      mainAxisSize: .min,
      spacing: 1,
      children: [
        Text(date.day.toString()),
        Text(
          weekday,
          style: context.theme.textTheme.labelSmall?.copyWith(
            color: context.theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );

    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        decoration: buttonDecoration,
        child: isBlocked
            ? GestureDetector(
                // Gesture detector to prevent the tap to the whole card.
                onTap: () {},
                onDoubleTap: () {},
                behavior: .opaque,
                child: Opacity(opacity: 0.5, child: child),
              )
            : Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    if (currentCompletion != null) {
                      unawaited(
                        repository.deleteHabitCompletion(
                          habit: habit,
                          completion: currentCompletion,
                        ),
                      );
                      return;
                    }

                    unawaited(
                      repository.addHabitCompletion(
                        habit: habit,
                        completion: HabitCompletion.create(
                          habitId: habit.id,
                          completedDate: date,
                        ),
                      ),
                    );
                  },
                  onLongPress: () {
                    if (currentCompletion != null &&
                        currentCompletion.type == .skipped) {
                      unawaited(
                        repository.deleteHabitCompletion(
                          habit: habit,
                          completion: currentCompletion,
                        ),
                      );
                      return;
                    }

                    unawaited(
                      repository.addHabitCompletion(
                        habit: habit,
                        completion:
                            currentCompletion?.copyWith(type: .skipped) ??
                            HabitCompletion.create(
                              habitId: habit.id,
                              completedDate: date,
                              type: .skipped,
                            ),
                      ),
                    );
                  },
                  borderRadius: radius,
                  child: Opacity(
                    opacity: isBlocked ? 0.5 : 1,
                    child: child,
                  ),
                ),
              ),
      ),
    );
  }

  static Gradient _strippedGradient(Color color) {
    final bg = color.withAlpha(40);
    final fg = color.withAlpha(240);
    return LinearGradient(
      begin: .topLeft,
      end: const Alignment(-0.5, -0.5),
      stops: const [0.0, 0.1, 0.4, 0.6, 0.9, 1],
      colors: [bg, bg, fg, fg, bg, bg],
      tileMode: TileMode.repeated,
    );
  }
}
