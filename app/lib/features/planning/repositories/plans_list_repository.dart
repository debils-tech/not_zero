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

    final forDateData = forDate.toIso8601String().split('T').first;
    final nextDateDate =
        forDate.add(const Duration(days: 1)).toIso8601String().split('T').first;

    final forDatePlansRows = await _supabase
        .from(_plansTableName)
        .select()
        .or(
          'for_date.eq.$forDateData,'
          // ignore: lines_longer_than_80_chars
          'and(for_date.lte.$forDateData,persistent.eq.true,or(and(completed_at.gte.$forDateData,completed_at.lt.$nextDateDate),completed_at.is.null))',
        )
        .range(rangeFrom, rangeFrom + rangeTo)
        .order('completed_at', ascending: false, nullsFirst: true)
        .order('created_at', ascending: true);

    final plansList = forDatePlansRows.map(DailyPlanModel.fromJson).toList();
    _log.fine('Loaded ${plansList.length} plans for date $forDate');

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
    bool persistent = false,
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
      persistent: persistent,
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
