import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/features/planning/models/daily_plan_model.dart';

class PlansMapStateHolder extends Notifier<Map<String, DailyPlanModel>> {
  @override
  Map<String, DailyPlanModel> build() {
    return const {};
  }

  void add(DailyPlanModel plan) {
    state = {
      ...state,
      plan.id: plan,
    };
  }

  void addAll(List<DailyPlanModel> plans) {
    state = {
      ...state,
      for (final plan in plans) plan.id: plan,
    };
  }

  void remove(DailyPlanModel plan) {
    state = Map<String, DailyPlanModel>.from(state)
      ..removeWhere((key, value) => key == plan.id);
  }

  void reset() {
    state = build();
  }
}
