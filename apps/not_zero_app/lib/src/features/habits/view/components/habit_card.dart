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
import 'package:flutter/services.dart';
import 'package:flutter_confetti/flutter_confetti.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:not_zero_app/src/features/habits/di.dart';
import 'package:not_zero_app/src/features/special_effects/di.dart';
import 'package:not_zero_app/src/features/special_effects/view/components/emoji_confetti_wrapper.dart';
import 'package:not_zero_app/src/features/stats/models/habits_counting_data.dart';
import 'package:nz_base_models/nz_base_models.dart';
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
    final habitsUiStyle = ref.watch(habitsUiStyleNotifierProvider);

    final confettiController = ref.watch(confettiControllerProvider(habit.id));

    return SelectableCard(
      onTap: () {
        unawaited(HapticFeedback.mediumImpact());

        if (currentCompletion != null) {
          confettiController.kill();
          unawaited(
            repository.deleteHabitCompletion(
              habit: habit,
              completion: currentCompletion,
            ),
          );
          return;
        }

        confettiController.launch();
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
      child: EmojiConfettiWrapper(
        controller: confettiController,
        options: const ConfettiOptions(
          particleCount: 30,
          spread: 35,
          angle: 180,
          gravity: 0.2,
          startVelocity: 20,
          ticks: 80,
          scalar: 0.75,
          x: 1,
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: switch (currentCompletion?.type) {
              .completed =>
                context.theme.colorScheme.primaryContainer.withAlpha(
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
              padding: const .only(left: 15, right: 8, top: 4, bottom: 6),
              child: AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: Column(
                  crossAxisAlignment: .stretch,
                  spacing: 8,
                  children: [
                    Row(
                      spacing: 4,
                      children: [
                        Expanded(
                          child: _HabitTextBlock(habit: habit),
                        ),
                        IconButton(
                          onPressed: () => context.push(
                            '/habits/view/${habit.id}',
                            extra: habit,
                          ),
                          tooltip:
                              context.t.habits.list.tooltips.viewHabitButton,
                          icon: const Icon(Icons.chevron_right_rounded),
                        ),
                      ],
                    ),
                    if (habitsUiStyle == .expanded)
                      _HabitCompletionsHistory(habit: habit),
                  ],
                ),
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
        Row(
          spacing: 4,
          children: [
            Expanded(
              child: Text(
                habit.title,
                overflow: .ellipsis,
                maxLines: 3,
                style: context.theme.textTheme.titleMedium?.copyWith(
                  fontWeight: .w600,
                ),
              ),
            ),
            _StreakCountIndicator(habit: habit),
          ],
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

class _StreakCountIndicator extends ConsumerWidget {
  const _StreakCountIndicator({required this.habit});

  final Habit habit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streakState = ref.watch(habitCurrentStreakNotifierProvider(habit));
    final streak = streakState.value;
    if (streak == null || streak == 0) return const SizedBox.shrink();

    final streakPeriod = HabitStreakPeriod.fromStreak(streak);
    final streakColor = switch (streakPeriod) {
      .fewDays => context.theme.colorScheme.onSurface,
      .fewWeeks => context.theme.colorScheme.secondary,
      .fewMonths => context.theme.colorScheme.primary,
    };
    final streakFontWeight = switch (streakPeriod) {
      .fewDays => FontWeight.w400,
      .fewWeeks => FontWeight.w600,
      .fewMonths => FontWeight.w700,
    };

    return Row(
      spacing: 2,
      children: [
        Text(
          streak.toString(),
          style: context.theme.textTheme.bodyMedium?.copyWith(
            color: streakColor,
            fontWeight: streakFontWeight,
          ),
        ),
        Icon(
          Icons.local_fire_department_rounded,
          size: 16,
          color: streakColor,
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
      crossAxisAlignment: .stretch,
      spacing: 1,
      children: [
        Text(
          date.day.toString(),
          textAlign: .center,
        ),
        Text(
          weekday,
          textAlign: .center,
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
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              unawaited(HapticFeedback.mediumImpact());
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
              unawaited(HapticFeedback.mediumImpact());
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
            child: child,
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
