import 'package:logging/logging.dart';
import 'package:not_zero/features/planning/models/daily_plan_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PlansListRepository {
  const PlansListRepository(this._supabase);

  final SupabaseClient _supabase;

  static final _log = Logger('PlansListRepository');
  static const _plansTableName = 'daily_plans';

  Future<List<DailyPlanModel>> getPlansPage({
    required int rangeFrom,
    required int rangeTo,
    required DateTime forDate,
  }) async {
    _log.finer('Loading plans page: $rangeFrom-$rangeTo '
        'with filters forDate: $forDate');

    final plansRows = await _supabase
        .from(_plansTableName)
        .select()
        .eq('for_date', forDate.toIso8601String())
        .range(rangeFrom, rangeFrom + rangeTo)
        .order('completed_at', ascending: false, nullsFirst: true)
        .order('created_at', ascending: true);

    final plansList = plansRows.map(DailyPlanModel.fromJson).toList();

    _log.fine('Loaded ${plansList.length} plans');

    return plansList;
  }

  Future<void> updatePlan(DailyPlanModel plan) async {
    _log.finer('Updating plan: $plan');

    await _supabase
        .from(_plansTableName)
        .update(plan.toJson())
        .eq('id', plan.id);

    _log.fine('Updated plan: $plan');
  }

  Future<DailyPlanModel> insertPlan({
    required DateTime forDate,
    required String title,
    String? description,
  }) async {
    _log.finer('Inserting plan: '
        'forDate $forDate, title $title, description $description');

    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) {
      _log.warning('No user id found for inserting plan');
      throw Exception('No user id');
    }

    final planModel = DailyPlanModelInsert(
      userId: userId,
      forDate: forDate,
      title: title,
      description: description ?? '',
    );

    _log.finer('Created model: $planModel');

    final newRow = await _supabase
        .from(_plansTableName)
        .insert(planModel.toJson())
        .select()
        .single();

    _log.fine('Inserted plan. Database returned: $newRow');

    return DailyPlanModel.fromJson(newRow);
  }

  Future<void> deletePlan(DailyPlanModel plan) async {
    _log.finer('Deleting plan: $plan');

    await _supabase.from(_plansTableName).delete().eq('id', plan.id);

    _log.fine('Deleted plan: $plan');
  }
}
