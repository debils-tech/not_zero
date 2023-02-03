import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/units/stats/domain/repositories/stats_repository.dart';
import 'package:not_zero/units/stats/presentation/bloc/states/quick_statistics_state.dart';

@injectable
class QuickStatisticsCubit extends Cubit<QuickStatisticsState> {
  QuickStatisticsCubit(this._repository) : super(QuickStatisticsState());

  final StatsRepository _repository;

  Future<void> loadStats() async {
    final weeklyStats = await _repository.getStatsForCurrentWeek();
    emit(QuickStatisticsState(weeklyStats: weeklyStats));
  }
}
