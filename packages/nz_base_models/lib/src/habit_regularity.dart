import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit_regularity.freezed.dart';
part 'habit_regularity.g.dart';

@freezed
sealed class HabitRegularity with _$HabitRegularity {
  const factory HabitRegularity.daily() = DailyHabitRegularity;

  const factory HabitRegularity.timesPerWeek(int times) =
      TimesPerWeekHabitRegularity;

  const factory HabitRegularity.atWeekdays(List<int> weekdays) =
      AtWeekdaysHabitRegularity;

  factory HabitRegularity.fromJson(Map<String, dynamic> json) =>
      _$HabitRegularityFromJson(json);
}
