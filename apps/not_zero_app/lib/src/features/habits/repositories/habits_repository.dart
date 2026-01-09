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

import 'package:collection/collection.dart';
import 'package:not_zero_app/src/features/habits/models/habit_action.dart';
import 'package:not_zero_app/src/features/habits/services/habits_local_service.dart';
import 'package:not_zero_app/src/features/notifications/models/app_notification_payload.dart';
import 'package:not_zero_app/src/features/notifications/repositories/notifications_show_repository.dart';
import 'package:nz_actions_bus/nz_actions_bus.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_common/nz_common.dart';

class HabitsRepository implements BaseRepository {
  const HabitsRepository(
    this._localService,
    this._notificationsShowRepository,
    this._actionsBus,
  );

  final HabitsLocalService _localService;
  final NotificationsShowRepository _notificationsShowRepository;
  final ActionsBus _actionsBus;

  Future<List<Habit>> getAllHabits() => _localService.getHabits();

  Future<void> addHabit(Habit habit) async {
    _actionsBus.emit(HabitAction.created(habit: habit));

    await _localService.saveHabit(habit);

    await _scheduleHabitReminder(habit);
  }

  Future<void> updateHabit({
    required Habit oldHabit,
    required Habit newHabit,
  }) async {
    _actionsBus.emit(
      HabitAction.updated(oldHabit: oldHabit, newHabit: newHabit),
    );

    await _localService.saveHabit(newHabit);

    if (oldHabit.reminderTime != null && newHabit.reminderTime == null) {
      // If reminder was removed from habit, cancel scheduled reminder
      await _cancelHabitSchedule(oldHabit);
    } else if (oldHabit.reminderTime != newHabit.reminderTime) {
      // Reschedule only if  reminder was changed
      await _scheduleHabitReminder(newHabit);
    }
  }

  Future<void> deleteHabits(Iterable<Habit> habits) async {
    _actionsBus.emit(HabitAction.deleted(habits: habits));

    await _localService.deleteHabits(habits.map((e) => e.id).toSet());

    for (final habit in habits) {
      await _cancelHabitSchedule(habit);
    }
  }

  Future<List<Pair<DateTime, HabitCompletion?>>> getHabitCompletionsAroundDate({
    required String habitId,
    int daysBefore = 0,
    int daysAfter = 0,
  }) async {
    final today = DateTime.now();
    final startDate = today.subtract(Duration(days: daysBefore));
    final endDate = today.add(Duration(days: daysAfter));

    final completions = await _localService.getHabitCompletions(
      habitId: habitId,
      startDate: startDate,
      endDate: endDate,
    );

    return startDate
        .rangeToIncluding(endDate)
        .map(
          (date) => (
            date,
            completions.firstWhereOrNull(
              (completion) => completion.completedDate.isAtSameDay(date),
            ),
          ),
        )
        .toList();
  }

  Future<int> getHabitStreak({required Habit habit, DateTime? date}) async {
    return _localService.getHabitStreak(
      habitId: habit.id,
      streakDate: date ?? DateTime.now(),
    );
  }

  Future<void> addHabitCompletion({
    required Habit habit,
    required HabitCompletion completion,
  }) async {
    final streakForCompletion = await _localService.getHabitStreak(
      habitId: habit.id,
      streakDate: completion.completedDate,
      includeExactDate: false,
    );
    completion = completion.copyWith(
      streakCount: completion.type == HabitCompletionType.completed
          ? streakForCompletion + 1
          : streakForCompletion,
    );

    _actionsBus.emit(
      HabitAction.completed(habit: habit, completion: completion),
    );

    await _localService.saveCompletion(completion);

    final reminderTime = habit.reminderTime;
    if (completion.completedDate.isAtSameDay(DateTime.now()) &&
        reminderTime != null) {
      // If habit was completed for today (latest available date),
      // we should cancel reminder for this day.
      // Passing just a completion date since time doesn't matter for canceling.
      await _cancelReminderForDate(habit, completion.completedDate);
    }
  }

  Future<void> deleteHabitCompletion({
    required Habit habit,
    required HabitCompletion completion,
  }) async {
    _actionsBus.emit(
      HabitAction.notCompleted(habit: habit, completion: completion),
    );

    await _localService.deleteCompletion(completion);

    final reminderTime = habit.reminderTime;
    if (completion.completedDate.isAtSameDay(DateTime.now()) &&
        reminderTime != null) {
      // If habit was completed for today (latest available date) and completion was deleted,
      // we should schedule a reminder (it was possibly deleted previously).
      final reminderDateTime = completion.completedDate.startOfDay.add(
        reminderTime.toDuration(),
      );
      await _scheduleReminderForDate(habit, reminderDateTime);
    }
  }

  Future<void> _scheduleHabitReminder(Habit habit) {
    final reminderTime = habit.reminderTime;
    if (reminderTime == null) return Future.value();

    final reminderDateTimes = _reminderDateTimes(reminderTime);
    // FIXME(uSlashVlad): Doesn't check if habit was completed for today.
    // Scheduling reminders on all specified dates
    return Future.wait(
      reminderDateTimes.map(
        (reminderDateTime) => _scheduleReminderForDate(habit, reminderDateTime),
      ),
    );
  }

  Future<void> _scheduleReminderForDate(
    Habit habit,
    DateTime reminderDateTime,
  ) => _notificationsShowRepository.scheduleReminder(
    id: _habitReminderId(habit.id, reminderDateTime),
    text: habit.title,
    scheduleDateTime: reminderDateTime,
    payload: AppNotificationPayload.habitReminder(
      habitId: habit.id,
      forDateTime: reminderDateTime,
    ),
    idGroup: _taskReminderIdGroup,
  );

  Future<void> _cancelHabitSchedule(Habit habit) {
    final reminderTime = habit.reminderTime;
    if (reminderTime == null) return Future.value();

    final reminderDateTimes = _reminderDateTimes(reminderTime);
    return Future.wait(
      reminderDateTimes.map(
        (reminderDateTime) => _cancelReminderForDate(habit, reminderDateTime),
      ),
    );
  }

  Future<void> _cancelReminderForDate(Habit habit, DateTime reminderDateTime) =>
      _notificationsShowRepository.cancelReminder(
        id: _habitReminderId(habit.id, reminderDateTime),
        idGroup: _taskReminderIdGroup,
      );

  Iterable<DateTime> _reminderDateTimes(ReminderLocalTime reminderTime) sync* {
    final currentTime = DateTime.now();
    var reminderDateTime = currentTime.startOfDay.add(
      reminderTime.toDuration(),
    );
    final scheduleEnd = reminderDateTime.add(const Duration(days: 15));

    // Scheduling on 2 weeks from today (skipping if this time has passed)
    while (reminderDateTime.isBefore(scheduleEnd)) {
      if (reminderDateTime.isBefore(currentTime)) continue;
      yield reminderDateTime;
      reminderDateTime = reminderDateTime.add(const Duration(days: 1));
    }
  }

  static String _habitReminderId(String habitId, DateTime reminderDateTime) =>
      '${reminderDateTime.year}-${reminderDateTime.month}-${reminderDateTime.day}:$habitId';

  static const _taskReminderIdGroup = 'habit:reminder';
}
