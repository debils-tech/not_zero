import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_common/nz_common.dart';

part 'habit_month_calendar_state.freezed.dart';

@freezed
abstract class HabitMonthCalendarState with _$HabitMonthCalendarState {
  const factory HabitMonthCalendarState({
    required int year,
    required int month,
    required List<Pair<DateTime, HabitCompletion?>> completions,
    @Default(false) bool isReloading,
  }) = _HabitMonthCalendarState;

  static bool canGoNextMonth(int year, int month) {
    final now = DateTime.now();
    if (year < now.year) return true;
    if (year == now.year && month < now.month) return true;
    return false;
  }
}
