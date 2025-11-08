import 'package:not_zero_app/src/features/habits/services/habits_local_service.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_common/nz_common.dart';

class HabitsRepository implements BaseRepository {
  const HabitsRepository(this._localService);

  final HabitsLocalService _localService;

  Future<List<Habit>> getAllHabits() {
    final currentDate = DateTime.now();
    final startDate = currentDate.subtract(const Duration(days: 30));

    return _localService.getHabitsWithCompletions(
      startDate: startDate,
      endDate: currentDate,
    );
  }

  Future<void> addHabit(Habit habit) {
    return _localService.saveHabit(habit);
  }

  Future<void> updateHabit({
    required Habit oldHabit,
    required Habit newHabit,
  }) {
    return _localService.saveHabit(newHabit);
  }

  Future<void> deleteHabit(Habit habit) {
    return _localService.deleteHabit(habit);
  }
}
