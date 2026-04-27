// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2026 Nagorny Vladislav
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
import 'package:intl/intl.dart';
import 'package:not_zero_app/src/features/habits/di.dart';
import 'package:not_zero_app/src/features/habits/models/habit_month_calendar_state.dart';
import 'package:not_zero_app/src/features/settings/di.dart';
import 'package:not_zero_app/src/helpers/build_context_quick_access_ext.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_common/nz_common.dart';

/// Monthly habit completion calendar. Read-only cells.
class HabitCalendarSection extends ConsumerWidget {
  const HabitCalendarSection({required this.habit, super.key});

  final Habit habit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(habitMonthCompletionsNotifierProvider(habit));
    final weekStart = ref.watch(effectiveFirstWeekdayProvider);
    final notifier = ref.read(
      habitMonthCompletionsNotifierProvider(habit).notifier,
    );

    final String title;
    final bool navEnabled;
    final bool canGoNext;

    switch (async) {
      case AsyncData(:final value):
        title = DateFormat.yMMMM().format(DateTime(value.year, value.month));
        navEnabled = !value.isReloading;
        canGoNext = HabitMonthCalendarState.canGoNextMonth(
          value.year,
          value.month,
        );
      default:
        title = DateFormat.yMMMM().format(DateTime.now());
        navEnabled = false;
        canGoNext = false;
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: navEnabled
                      ? () => unawaited(notifier.goToPreviousMonth())
                      : null,
                  icon: const Icon(Icons.chevron_left_rounded),
                  tooltip: MaterialLocalizations.of(
                    context,
                  ).previousMonthTooltip,
                ),
                Expanded(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: context.theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: navEnabled && canGoNext
                      ? () => unawaited(notifier.goToNextMonth())
                      : null,
                  icon: const Icon(Icons.chevron_right_rounded),
                  tooltip: MaterialLocalizations.of(context).nextMonthTooltip,
                ),
              ],
            ),
            const SizedBox(height: 8),
            switch (async) {
              AsyncData(:final value) when value.isReloading => const SizedBox(
                height: 220,
                child: Center(child: CircularProgressIndicator()),
              ),
              AsyncData(:final value) => _CalendarGrid(
                year: value.year,
                month: value.month,
                weekStart: weekStart,
                leadingBlanks:
                    (DateTime(value.year, value.month).weekday - weekStart) %
                    DateTime.daysPerWeek,
                daysInMonth: DateTime(value.year, value.month + 1, 0).day,
                pairs: value.completions,
              ),
              AsyncLoading() => const SizedBox(
                height: 220,
                child: Center(child: CircularProgressIndicator()),
              ),
              AsyncError(:final error) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  error.toString(),
                  style: context.theme.textTheme.bodySmall?.copyWith(
                    color: context.theme.colorScheme.error,
                  ),
                ),
              ),
            },
          ],
        ),
      ),
    );
  }
}

class _CalendarGrid extends StatelessWidget {
  const _CalendarGrid({
    required this.year,
    required this.month,
    required this.weekStart,
    required this.leadingBlanks,
    required this.daysInMonth,
    required this.pairs,
  });

  final int year;
  final int month;
  final int weekStart;
  final int leadingBlanks;
  final int daysInMonth;
  final List<Pair<DateTime, HabitCompletion?>> pairs;

  @override
  Widget build(BuildContext context) {
    final totalCells = leadingBlanks + daysInMonth;
    final rowCount =
        (totalCells + DateTime.daysPerWeek - 1) ~/ DateTime.daysPerWeek;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _WeekdayHeaderRow(weekStart: weekStart),
        const SizedBox(height: 6),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: DateTime.daysPerWeek,
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
          ),
          itemCount: rowCount * DateTime.daysPerWeek,
          itemBuilder: (context, index) {
            if (index < leadingBlanks) {
              final cellDate = DateTime(
                year,
                month,
              ).subtract(Duration(days: leadingBlanks - index)).startOfDay;
              return _CalendarDayCell(
                date: cellDate,
                outsideCurrentMonth: true,
              );
            }

            final dayNumber = index - leadingBlanks + 1;
            if (dayNumber <= daysInMonth) {
              final cellDate = DateTime(year, month, dayNumber).startOfDay;
              final completion = pairs[dayNumber - 1].$2;
              return _CalendarDayCell(
                date: cellDate,
                completion: completion,
              );
            }

            final trailingIndex = index - leadingBlanks - daysInMonth;
            final cellDate = DateTime(
              year,
              month + 1,
              1 + trailingIndex,
            ).startOfDay;
            return _CalendarDayCell(
              date: cellDate,
              outsideCurrentMonth: true,
            );
          },
        ),
      ],
    );
  }
}

/// Weekday labels aligned with calendar columns.
class _WeekdayHeaderRow extends StatelessWidget {
  const _WeekdayHeaderRow({required this.weekStart});

  final int weekStart;

  @override
  Widget build(BuildContext context) {
    final monday = DateTime(2024);
    final startOffset =
        (weekStart - DateTime.monday + DateTime.daysPerWeek) %
        DateTime.daysPerWeek;
    final startDate = monday.add(Duration(days: startOffset));
    final labels = List.generate(
      DateTime.daysPerWeek,
      (i) => DateFormat(
        DateFormat.ABBR_WEEKDAY,
      ).format(startDate.add(Duration(days: i))).toUpperCase(),
    );

    return Row(
      children: [
        for (final label in labels)
          Expanded(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: context.theme.textTheme.labelSmall?.copyWith(
                color: context.theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
      ],
    );
  }
}

class _CalendarDayCell extends StatelessWidget {
  const _CalendarDayCell({
    required this.date,
    this.completion,
    this.outsideCurrentMonth = false,
  });

  final DateTime date;
  final HabitCompletion? completion;
  final bool outsideCurrentMonth;

  static const _radius = BorderRadius.all(Radius.circular(8));

  static Gradient _strippedGradient(Color color) {
    final bg = color.withAlpha(40);
    final fg = color.withAlpha(240);
    return LinearGradient(
      begin: Alignment.topLeft,
      end: const Alignment(-0.5, -0.5),
      stops: const [0.0, 0.1, 0.4, 0.6, 0.9, 1],
      colors: [bg, bg, fg, fg, bg, bg],
      tileMode: TileMode.repeated,
    );
  }

  @override
  Widget build(BuildContext context) {
    final decoration = switch (completion?.type) {
      HabitCompletionType.completed => ShapeDecoration(
        color: context.theme.colorScheme.primaryContainer,
        shape: ContinuousRectangleBorder(
          borderRadius: _radius,
          side: BorderSide(
            color: context.theme.colorScheme.primary,
          ),
        ),
      ),
      HabitCompletionType.skipped => ShapeDecoration(
        gradient: _strippedGradient(
          context.theme.colorScheme.primaryContainer,
        ),
        shape: ContinuousRectangleBorder(
          borderRadius: _radius,
          side: BorderSide(
            color: context.theme.colorScheme.primary.withAlpha(127),
          ),
        ),
      ),
      null => ShapeDecoration(
        shape: ContinuousRectangleBorder(
          borderRadius: _radius,
          side: BorderSide(
            color: context.theme.colorScheme.surfaceContainerHighest,
          ),
        ),
      ),
    };

    final dayStyle = context.theme.textTheme.bodySmall?.copyWith(
      fontWeight: FontWeight.w500,
      color: completion?.type == HabitCompletionType.completed
          ? context.theme.colorScheme.onPrimaryContainer
          : context.theme.colorScheme.onSurface,
    );

    final cell = AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: DecoratedBox(
          decoration: decoration,
          child: Center(
            child: Text(
              '${date.day}',
              textAlign: TextAlign.center,
              style: dayStyle,
            ),
          ),
        ),
      ),
    );

    if (outsideCurrentMonth) {
      return Opacity(
        opacity: 0.42,
        child: cell,
      );
    }
    return cell;
  }
}
