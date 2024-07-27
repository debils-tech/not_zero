import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/features/planning/providers.dart';

class PlansDaySelector extends ConsumerWidget {
  const PlansDaySelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filtersState = ref.watch(plansFiltersStateProvider);
    final plansManager = ref.watch(plansListManagerProvider);

    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 32),
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                plansManager.updateFilters(
                  filtersState.copyWith(
                    forDate: DateTime.now().subtract(const Duration(days: 1)),
                  ),
                );
              },
              child: const Text('Yesterday'),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                plansManager.updateFilters(
                  filtersState.copyWith(
                    forDate: DateTime.now(),
                  ),
                );
              },
              child: const Text('Today'),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                plansManager.updateFilters(
                  filtersState.copyWith(
                    forDate: DateTime.now().add(const Duration(days: 1)),
                  ),
                );
              },
              child: const Text('Tomorrow'),
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () async {
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
            },
            icon: const Icon(Icons.calendar_month_rounded),
          ),
        ],
      ),
    );
  }
}
