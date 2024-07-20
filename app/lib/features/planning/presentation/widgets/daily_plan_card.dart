import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/features/planning/models/daily_plan_model.dart';
import 'package:not_zero/features/planning/providers.dart';

class DailyPlanCard extends ConsumerWidget {
  const DailyPlanCard({required this.plan, super.key});

  final DailyPlanModel plan;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plansListManager = ref.watch(plansListManagerProvider);

    return Card(
      elevation: 2,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Checkbox(
                value: plan.completedAt != null,
                onChanged: (value) =>
                    plansListManager.changePlanCompletionStatus(
                  plan,
                  completed: value ?? false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(plan.title),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
