// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2025 Nagorny Vladislav
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/actions_bus/di.dart';
import 'package:not_zero_app/src/features/habits/notifiers/habits_completions_history_notifier.dart';
import 'package:not_zero_app/src/features/habits/notifiers/habits_list_notifier.dart';
import 'package:not_zero_app/src/features/habits/repositories/habits_repository.dart';
import 'package:not_zero_app/src/features/habits/services/habits_local_service.dart';
import 'package:not_zero_app/src/features/storage/di.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_common/nz_common.dart';

final habitsLocalServiceProvider = Provider<HabitsLocalService>((ref) {
  return HabitsLocalService(
    ref.watch(databaseProvider),
  );
});

final habitsRepositoryProvider = Provider<HabitsRepository>((ref) {
  return HabitsRepository(
    ref.watch(habitsLocalServiceProvider),
    ref.watch(actionsBusProvider),
  );
});

final habitsListNotifierProvider = AsyncNotifierProvider.autoDispose(
  HabitsListNotifier.new,
);

final habitCompletionsWeekHistoryNotifierProvider = AsyncNotifierProvider
    .autoDispose
    .family<
      HabitsCompletionsHistoryNotifier,
      List<Pair<DateTime, HabitCompletion?>>,
      Habit
    >(
      (habit) => HabitsCompletionsHistoryNotifier(habit: habit, daysCount: 7),
    );
