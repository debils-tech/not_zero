import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logging/logging.dart';
import 'package:not_zero/features/planning/models/daily_plan_model.dart';
import 'package:not_zero/features/planning/models/plans_filter_model.dart';
import 'package:not_zero/features/planning/repositories/plans_list_repository.dart';
import 'package:not_zero/features/planning/state_holders/plans_map_state_holder.dart';
import 'package:not_zero/utils/async_lifecycle_object.dart';

class PlansListManager implements AsyncLifecycleObject {
  PlansListManager(
    this._repository,
    this._plansFiltersStateController,
    this._pagingController,
    this._mapStateHolder,
  );

  final PlansListRepository _repository;
  final StateController<PlansFilterModel> _plansFiltersStateController;
  final PagingController<int, DailyPlanModel> _pagingController;
  final PlansMapStateHolder _mapStateHolder;

  static const _pageSize = 20;
  static final _log = Logger('PlansListManager');

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

      final plansList = await _repository.getPlansPage(
        rangeFrom: rangeFrom,
        rangeTo: rangeTo,
        forDate: filters.forDate,
      );

      if (plansList.length < _pageSize) {
        _log.finer('Loaded last page: ${plansList.length} < $_pageSize');
        _pagingController.appendLastPage(plansList);
      } else {
        _log.finer('Loaded another page: ${plansList.length}, '
            'incrementing page key');
        _pagingController.appendPage(plansList, pageKey + 1);
      }

      _mapStateHolder.addAll(plansList);

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
    _mapStateHolder.reset();

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

    _updateItemInPagination(updatedItem);

    try {
      await _repository.updatePlan(updatedItem);
    } catch (e, s) {
      _log.severe('Error while updating plan completion in supabase', e, s);
    }
  }

  Future<bool> addPlan({
    required String title,
    String? description,
    DateTime? forDate,
  }) async {
    final dateToAdd = forDate ?? _plansFiltersStateController.state.forDate;

    try {
      final newPlan = await _repository.insertPlan(
        forDate: dateToAdd,
        title: title,
        description: description,
      );

      _log.finer('Added plan in supabase: $newPlan');

      _addItemToPagination(newPlan);
      _log.finer('Added plan in page state');
      return true;
    } catch (e, s) {
      _log.severe('Error while adding plan in supabase', e, s);
      return false;
    }
  }

  Future<bool> editPlan(
    DailyPlanModel plan, {
    required String title,
    String? description,
  }) async {
    final newPlan = plan.copyWith(
      title: title,
      description: description ?? '',
    );

    try {
      await _repository.updatePlan(newPlan);

      _log.finer('Updated plan in supabase: $newPlan');

      _updateItemInPagination(newPlan);
      _log.finer('Updated plan in page state');
      return true;
    } catch (e, s) {
      _log.severe('Error while adding plan in supabase', e, s);
      return false;
    }
  }

  void _addItemToPagination(DailyPlanModel item) {
    final currentList =
        List<DailyPlanModel>.from(_pagingController.itemList ?? []);
    _pagingController.value = PagingState(
      nextPageKey: _pagingController.nextPageKey,
      error: _pagingController.error,
      itemList: [
        ...currentList,
        item,
      ],
    );

    _mapStateHolder.add(item);
  }

  void _updateItemInPagination(DailyPlanModel item) {
    final itemList =
        List<DailyPlanModel>.from(_pagingController.itemList ?? []);
    final itemIndex = itemList.indexWhere((item) => item.id == item.id);
    _log.finest('Item index for ${item.id}: $itemIndex');
    if (itemIndex == -1) {
      _pagingController.value = PagingState(
        nextPageKey: _pagingController.nextPageKey,
        error: _pagingController.error,
        itemList: [...itemList, item],
      );
      _log.finer('Added item with id ${item.id} to the end of the list');
    } else {
      itemList[itemIndex] = item;
      _pagingController.value = PagingState(
        nextPageKey: _pagingController.nextPageKey,
        error: _pagingController.error,
        itemList: itemList,
      );
      _log.finer('Replaced item with id ${item.id} in the list');
    }

    _mapStateHolder.add(item);
  }
}
