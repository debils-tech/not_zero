import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nz_base_models/nz_base_models.dart';

part 'check_in_streak_state.freezed.dart';

@freezed
sealed class CheckInStreakState with _$CheckInStreakState {
  const factory CheckInStreakState.checkedIn({
    required AppDailyCheckIn checkIn,
  }) = CheckInStreakStateCheckedIn;

  const factory CheckInStreakState.streakContinued({
    required AppDailyCheckIn lastCheckIn,
  }) = CheckInStreakStateContinued;

  const factory CheckInStreakState.streakLost({
    required AppDailyCheckIn lastCheckIn,
  }) = CheckInStreakStateLost;

  const factory CheckInStreakState.noCheckIn() = CheckInStreakStateNoCheckIn;
}
