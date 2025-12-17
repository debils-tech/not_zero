import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/check_in/di.dart';
import 'package:not_zero_app/src/features/check_in/models/check_in_streak_state.dart';

class CheckInStateNotifier extends AsyncNotifier<CheckInStreakState> {
  @override
  Future<CheckInStreakState> build() {
    return ref.watch(checkInRepositoryProvider).getCurrentStreakState();
  }

  Future<void> checkIn() async {
    final newCheckIn = await ref.watch(checkInRepositoryProvider).checkIn();
    state = AsyncValue.data(CheckInStreakState.checkedIn(checkIn: newCheckIn));
  }
}
