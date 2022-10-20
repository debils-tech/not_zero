import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/units/home/presentation/bloc/states/home_score_state.dart';
import 'package:not_zero/units/stats/domain/repositories/stats_repository.dart';

@injectable
class HomeScoreCubit extends Cubit<HomeScoreState> {
  HomeScoreCubit(this._repository) : super(const HomeScoreState()) {
    _countingSub = _repository.getTotalPoints().listen(_countChangeListener);
    _repository.countTotalPoints();
  }

  final StatsRepository _repository;

  StreamSubscription<int>? _countingSub;

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
