import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logging/logging.dart';
import 'package:not_zero/features/planning/models/daily_plan_model.dart';
import 'package:not_zero/features/planning/models/plans_filter_model.dart';
import 'package:not_zero/utils/async_lifecycle_object.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PlansListManager extends AsyncLifecycleObject {
  PlansListManager(
    this._supabase,
    this._plansFiltersStateController,
    this._pagingController,
  );

  final SupabaseClient _supabase;
  final StateController<PlansFilterModel> _plansFiltersStateController;
  final PagingController<int, DailyPlanModel> _pagingController;

  static const _pageSize = 20;
  static final _log = Logger('PlansListManager');
  static const _plansTableName = 'daily_plans';

  @override
  void init() {
    _log.finer('init');
    _pagingController.addPageRequestListener(_loadPage);
  }

  @override
  void dispose() {
    _log.finer('dispose');
    _pagingController.removePageRequestListener(_loadPage);
  }

  Future<void> _loadPage(int pageKey) async {
    try {
      final rangeFrom = pageKey * _pageSize;
      final rangeTo = rangeFrom + _pageSize;

      final filters = _plansFiltersStateController.state;

      _log.finer('Starting loading plans page #$pageKey ($rangeFrom-$rangeTo) '
          'with filters: $filters');

      final plansRows = await _supabase
          .from(_plansTableName)
          .select()
          // .eq('for_date', filters.forDate)
          .range(rangeFrom, rangeFrom + rangeTo);

      _log.finest('Loaded ${plansRows.length} plans');

      final plansList = plansRows.map(DailyPlanModel.fromJson).toList();

      if (plansList.length < _pageSize) {
        _log.finer('Loaded last page: ${plansList.length} < $_pageSize');
        _pagingController.appendLastPage(plansList);
      } else {
        _log.finer('Loaded another page: ${plansList.length}, '
            'incrementing page key');
        _pagingController.appendPage(plansList, pageKey + 1);
      }

      _log.finest('Loaded another page of plans: '
          '${_pagingController.itemList?.length} items , '
          '${_pagingController.nextPageKey} key');
    } catch (e, s) {
      _log.severe('Error while loading plans page #$pageKey', e, s);
      rethrow;
    }
  }

  void updateFilters(PlansFilterModel filter) {
    _log.finer('Updating plan filters: $filter');
    _plansFiltersStateController.state = filter;

    _pagingController.refresh();
  }

  Future<void> changePlanCompletionStatus(
    DailyPlanModel plan, {
    required bool completed,
  }) async {
    _log.finer('Compeling plan: $plan, completion $completed');
    final updatedItem = plan.copyWith(
      completedAt: completed ? DateTime.now() : null,
    );

    final itemList =
        List<DailyPlanModel>.from(_pagingController.itemList ?? []);
    final itemIndex = itemList.indexWhere((item) => item.id == plan.id);
    _log.finest('Item index for ${plan.id}: $itemIndex');
    if (itemIndex == -1) {
      _pagingController.value = PagingState(
        nextPageKey: _pagingController.nextPageKey,
        error: _pagingController.error,
        itemList: [...itemList, updatedItem],
      );
      _log.finer('Added item with id ${plan.id} to the end of the list');
    } else {
      itemList[itemIndex] = updatedItem;
      _pagingController.value = PagingState(
        nextPageKey: _pagingController.nextPageKey,
        error: _pagingController.error,
        itemList: itemList,
      );
      _log.finer('Replaced item with id ${plan.id} in the list');
    }

    _log.finest('Updating plan in supabase');

    try {
      await _upsertPlan(updatedItem);
      _log.fine('Updated plan on screen and in supabase');
    } catch (e, s) {
      _log.severe('Error while updating plan completion in supabase', e, s);
    }
  }

  Future<void> _upsertPlan(DailyPlanModel plan) {
    final insertItem = DailyPlanModelInsert(
      forDate: plan.forDate,
      title: plan.title,
      description: plan.description,
      completedAt: plan.completedAt,
    );
    return _supabase
        .from(_plansTableName)
        .upsert(insertItem.toJson())
        .eq('id', plan.id);
  }
}
