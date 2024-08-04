import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:not_zero/features/planning/models/daily_plan_model.dart';
import 'package:not_zero/features/planning/providers.dart';
import 'package:not_zero/features/router/router.dart';
import 'package:not_zero/utils/build_context_extensions.dart';

class PlanViewBottomSheet extends ConsumerWidget {
  const PlanViewBottomSheet({required this.planId, super.key});

  final String planId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plan = ref.watch(_specificPlanItemProvider(planId));
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
          const Gap(8),
          CheckboxListTile(
            value: completionTime != null,
            onChanged: (value) => plansListManager
                .changePlanCompletionStatus(plan, completed: value ?? false),
            controlAffinity: ListTileControlAffinity.leading,
            visualDensity: VisualDensity.compact,
            title: Text(completionText),
          ),
          const Gap(16),
          Row(
            children: [
              Expanded(
                child: Text(
                  plan.title,
                  style: context.textTheme.titleLarge,
                ),
              ),
              const Gap(4),
              IconButton(
                onPressed: () {
                  router
                    ..pop()
                    ..push('/plans/edit/$planId');
                },
                icon: const Icon(Icons.edit_rounded),
              ),
              const Gap(4),
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
          const Gap(8),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                plan.description,
              ),
            ),
          ),
          const Gap(32),
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
