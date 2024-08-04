import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/features/planning/providers.dart';
import 'package:not_zero/utils/date_time_extensions.dart';

class PlansDaySelector extends StatelessWidget {
  const PlansDaySelector({super.key});

  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now();
    final yesterDayDate = currentDate.dayBefore;
    final tomorrowDate = currentDate.dayAfter;

    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 32),
          _DateSelector(
            text: 'Yest',
            date: yesterDayDate,
          ),
          const SizedBox(width: 10),
          _DateSelector(
            text: 'Today',
            date: currentDate,
          ),
          const SizedBox(width: 10),
          _DateSelector(
            text: 'Tmrw',
            date: tomorrowDate,
          ),
          const SizedBox(width: 10),
          _CustomDateSelector(
            excludeDates: [currentDate, yesterDayDate, tomorrowDate],
          ),
        ],
      ),
    );
  }
}

class _DateSelector extends ConsumerWidget {
  const _DateSelector({required this.text, required this.date});

  final String text;
  final DateTime date;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filtersState = ref.watch(plansFiltersStateProvider);
    final plansManager = ref.watch(plansListManagerProvider);

    void onTap() {
      plansManager.updateFilters(
        filtersState.copyWith(
          forDate: date,
        ),
      );
    }

    final isSameDay = date.isSameDay(filtersState.forDate);

    return Expanded(
      child: isSameDay
          ? FilledButton(
              onPressed: onTap,
              child: Text(text),
            )
          : OutlinedButton(
              onPressed: onTap,
              child: Text(text),
            ),
    );
  }
}

class _CustomDateSelector extends ConsumerWidget {
  const _CustomDateSelector({required this.excludeDates});

  final List<DateTime> excludeDates;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filtersState = ref.watch(plansFiltersStateProvider);
    final plansManager = ref.watch(plansListManagerProvider);

    Future<void> onTap() async {
      final pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970),
        lastDate: DateTime(2077),
      );
      if (pickedDate == null) return;

      plansManager.updateFilters(
        filtersState.copyWith(
          forDate: pickedDate,
        ),
      );
    }

    const icon = Icon(Icons.calendar_month_rounded);

    final isSameDay = excludeDates.every(
      (date) => !date.isSameDay(filtersState.forDate),
    );

    return isSameDay
        ? IconButton.filled(
            onPressed: onTap,
            icon: icon,
          )
        : IconButton(
            onPressed: onTap,
            icon: icon,
          );
  }
}
