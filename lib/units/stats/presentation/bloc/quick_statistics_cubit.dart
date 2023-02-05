import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/helpers/date_transformations.dart';
import 'package:not_zero/units/stats/domain/repositories/stats_repository.dart';
import 'package:not_zero/units/stats/presentation/bloc/states/quick_statistics_state.dart';

@injectable
class QuickStatisticsCubit extends Cubit<QuickStatisticsState> {
  QuickStatisticsCubit(this._repository) : super(QuickStatisticsState());

  final StatsRepository _repository;

  Future<void> loadStats([DateTime? start, DateTime? end]) async {
    final rangeStart = start ?? DateTime.now().startOfWeek;
    final rangeEnd = end ?? DateTime.now().endOfWeek;
    final weeklyStats = await _repository.getStatsByDays(rangeStart, rangeEnd);

    emit(
      QuickStatisticsState(
        chartStats: weeklyStats,
        chartRangeStart: rangeStart,
        chartRangeEnd: rangeEnd,
      ),
    );
  }
}
