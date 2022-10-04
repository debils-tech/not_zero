import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/units/stats/domain/repositories/stats_repository.dart';

@injectable
class UserTotalPointsCubit extends Cubit<int> {
  UserTotalPointsCubit(this._repository) : super(0) {
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
    emit(newValue);
  }
}
