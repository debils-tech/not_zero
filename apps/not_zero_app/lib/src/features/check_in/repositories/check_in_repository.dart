import 'package:not_zero_app/src/features/check_in/models/check_in_streak_state.dart';
import 'package:not_zero_app/src/features/check_in/services/check_in_local_service.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_common/nz_common.dart';

class CheckInRepository implements BaseRepository {
  const CheckInRepository(this._localService);

  final CheckInLocalService _localService;

  Future<CheckInStreakState> getCurrentStreakState() async {
    final today = DateTime.now();

    final lastCheckIn = await _localService.getLastCheckIn(streakDate: today);

    if (lastCheckIn == null) {
      // First time opened app
      return const CheckInStreakState.noCheckIn();
    }

    if (lastCheckIn.checkInDate.isAtSameDay(today)) {
      // Checked in today and should show current streak
      return CheckInStreakState.checkedIn(checkIn: lastCheckIn);
    }

    if (lastCheckIn.checkInDate.isAtSameDay(today.dayBefore)) {
      // Checked in yesterday and should show streak continued
      return CheckInStreakState.streakContinued(lastCheckIn: lastCheckIn);
    }

    if (lastCheckIn.streakCount == 1) {
      // There was no streak yet, so no streak lost
      return const CheckInStreakState.noCheckIn();
    }

    return CheckInStreakState.streakLost(lastCheckIn: lastCheckIn);
  }

  Future<AppDailyCheckIn> checkIn() async {
    final currentStreakState = await getCurrentStreakState();

    final newStreak = switch (currentStreakState) {
      CheckInStreakStateCheckedIn() => 0,
      CheckInStreakStateContinued() =>
        currentStreakState.lastCheckIn.streakCount + 1,
      CheckInStreakStateLost() || CheckInStreakStateNoCheckIn() => 1,
    };
    assert(
      newStreak != 0,
      "Shouldn't check in when already checked in on this day",
    );

    final newCheckIn = AppDailyCheckIn.create(
      checkInDate: DateTime.now(),
      streakCount: newStreak,
    );

    await _localService.saveCheckIn(newCheckIn);
    return newCheckIn;
  }
}
