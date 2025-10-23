import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/habits/di.dart';
import 'package:nz_base_models/nz_base_models.dart';

class HabitsListNotifier extends AsyncNotifier<List<Habit>> {
  @override
  Future<List<Habit>> build() async {
    return ref.watch(habitsRepositoryProvider).getAllHabits();
  }
}
