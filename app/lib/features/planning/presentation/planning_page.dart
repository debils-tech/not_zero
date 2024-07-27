import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:not_zero/features/planning/models/daily_plan_model.dart';
import 'package:not_zero/features/planning/presentation/widgets/daily_plan_card.dart';
import 'package:not_zero/features/planning/providers.dart';
import 'package:not_zero/features/router/router.dart';

class PlanningPage extends ConsumerWidget {
  const PlanningPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(plansListManagerProvider);
    final pagingController = ref.watch(plansPagingControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Planning'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => ref.watch(routerProvider).push('/plans/add'),
        icon: const Icon(Icons.add_rounded),
        label: const Text('Add'),
      ),
      body: PagedListView(
        pagingController: pagingController,
        padding: const EdgeInsets.all(16),
        builderDelegate: PagedChildBuilderDelegate<DailyPlanModel>(
          itemBuilder: (context, item, index) => DailyPlanCard(plan: item),
        ),
      ),
    );
  }
}
