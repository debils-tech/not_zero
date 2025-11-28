import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nz_base_models/nz_base_models.dart';

part 'habits_counting_data.freezed.dart';

@freezed
abstract class HabitsCountingData with _$HabitsCountingData {
  const factory HabitsCountingData({
    required Map<UniqueHabitCombination, int> completed,
    required int created,
  }) = _HabitsCountingData;
}

typedef UniqueHabitCombination = ({
  TaskImportance importance,
  HabitRegularity regularity,
});
