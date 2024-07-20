import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:not_zero/features/planning/managers/plans_list_manager.dart';
import 'package:not_zero/features/planning/models/daily_plan_model.dart';
import 'package:not_zero/features/planning/models/plans_filter_model.dart';
import 'package:not_zero/features/supabase/providers.dart';
import 'package:not_zero/utils/async_lifecycle_object.dart';

final plansListManagerProvider = Provider.autoDispose<PlansListManager>((ref) {
  return AsyncLifecycleObject.wrapProvider(
    ref,
    PlansListManager(
      ref.watch(supabaseClientProvider),
      ref.watch(plansFiltersStateProvider.notifier),
      ref.watch(plansPagingControllerProvider),
    ),
  );
});

final plansFiltersStateProvider =
    StateProvider.autoDispose<PlansFilterModel>((ref) {
  return PlansFilterModel(forDate: DateTime.now());
});

final plansPagingControllerProvider =
    Provider.autoDispose<PagingController<int, DailyPlanModel>>((ref) {
  final controller = PagingController<int, DailyPlanModel>(firstPageKey: 0);
  ref.onDispose(controller.dispose);

  return controller;
});
