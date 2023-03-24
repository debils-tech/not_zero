import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/units/stats/domain/repositories/stats_repository.dart';

part 'home_score_cubit.freezed.dart';
part 'home_score_state.dart';

@injectable
class HomeScoreCubit extends Cubit<HomeScoreState> {
  HomeScoreCubit(this._repository) : super(const HomeScoreState()) {
    _countingSub = _repository.getTotalPoints().listen(_countChangeListener);
  }

  final StatsRepository _repository;

  StreamSubscription<int>? _countingSub;

  Future<void> init() {
    return _repository.countTotalPoints();
  }

  @override
  Future<void> close() {
    _countingSub?.cancel();

    return super.close();
  }

  void _countChangeListener(int newValue) {
    if (newValue < 0) {
      emit(const HomeScoreState());
    } else {
      emit(HomeScoreState(totalPoints: newValue));
    }
  }
}
