import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:not_zero/features/planning/models/daily_plan_model.dart';
import 'package:not_zero/features/planning/presentation/plan_edit_bottom_sheet.dart';
import 'package:not_zero/features/planning/providers.dart';
import 'package:not_zero/features/router/router.dart';
import 'package:not_zero/utils/build_context_extensions.dart';

class PlanViewBottomSheet extends ConsumerWidget {
  const PlanViewBottomSheet({required this.plan, super.key});

  final DailyPlanModel plan;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plan = ref.watch(_specificPlanItemProvider(this.plan.id));
    if (plan == null) {
      return const SizedBox.shrink();
    }

    final plansListManager = ref.watch(plansListManagerProvider);
    final router = ref.watch(routerProvider);

    final dateFormat = DateFormat.MMMd();
    final timeFormat = DateFormat.Hm();

    final completionTime = plan.completedAt;
    final completionText = completionTime == null
        ? 'Not yet completed'
        : 'Completed at ${timeFormat.format(completionTime)}';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Plan for ${dateFormat.format(plan.forDate)}',
            style: context.textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          CheckboxListTile(
            value: completionTime != null,
            onChanged: (value) => plansListManager
                .changePlanCompletionStatus(plan, completed: value ?? false),
            controlAffinity: ListTileControlAffinity.leading,
            visualDensity: VisualDensity.compact,
            title: Text(completionText),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Text(
                  plan.title,
                  style: context.textTheme.titleLarge,
                ),
              ),
              const SizedBox(width: 4),
              IconButton(
                onPressed: () {
                  router.pop();
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (_) => PlanEditBottomSheet(planToEdit: plan),
                  );
                },
                icon: const Icon(Icons.edit_rounded),
              ),
              const SizedBox(width: 4),
              IconButton(
                onPressed: () {
                  router.pop();
                  plansListManager.deletePlan(plan);
                },
                color: context.colors.error,
                icon: const Icon(Icons.delete_outline_rounded),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                plan.description,
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

final _specificPlanItemProvider =
    Provider.autoDispose.family<DailyPlanModel?, String>((ref, planId) {
  final map = ref.watch(plansMapStateHolderProvider);
  return map[planId];
});
