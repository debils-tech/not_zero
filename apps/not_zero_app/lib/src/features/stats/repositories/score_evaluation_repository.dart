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

import 'package:not_zero_app/src/features/stats/models/check_in_couting_data.dart';
import 'package:not_zero_app/src/features/stats/models/habits_counting_data.dart';
import 'package:not_zero_app/src/features/stats/models/tasks_counting_data.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_common/nz_common.dart';

class ScoreEvaluationRepository implements BaseRepository {
  const ScoreEvaluationRepository();

  static const _taskCompletedNotImportantScore = 3;
  static const _taskCompletedNormalScore = 5;
  static const _taskCompletedImportantScore = 8;
  static const _taskCreatedScore = 1;

  static const _habitCompletedNotImportantScore = 1;
  static const _habitCompletedNormalScore = 2;
  static const _habitCompletedImportantScore = 3;
  static const _habitCreatedScore = 2;

  // --- TASKS ---

  int evaluateTasksScore(TasksCountingData countingData) =>
      countingData.notImportant * evaluateTaskImportanceScore(.notImportant) +
      countingData.normal * evaluateTaskImportanceScore(.normal) +
      countingData.important * evaluateTaskImportanceScore(.important) +
      countingData.created * evaluateTaskCreatedScore();

  int evaluateTaskImportanceScore(TaskImportance importance) =>
      switch (importance) {
        .notImportant => _taskCompletedNotImportantScore,
        .normal => _taskCompletedNormalScore,
        .important => _taskCompletedImportantScore,
      };

  int evaluateTaskCreatedScore() => _taskCreatedScore;

  // --- HABITS ---

  int evaluateHabitsScore(HabitsCountingData countingData) =>
      countingData.completed.entries
          .fold<double>(
            0,
            (sum, entry) =>
                // Calculate score by multiplying amount of completions
                // by the score for this combination
                sum +
                entry.value *
                    evaluateSingleHabitScore(
                      entry.key.importance,
                      entry.key.streakPeriod,
                    ),
          )
          .floor() +
      countingData.created * evaluateHabitCreatedScore();

  int evaluateSingleHabitScore(
    TaskImportance importance,
    HabitStreakPeriod streakPeriod,
  ) =>
      switch (importance) {
        .notImportant => _habitCompletedNotImportantScore,
        .normal => _habitCompletedNormalScore,
        .important => _habitCompletedImportantScore,
      } *
      switch (streakPeriod) {
        HabitStreakPeriod.fewDays => 1,
        HabitStreakPeriod.fewWeeks => 2,
        HabitStreakPeriod.fewMonths => 3,
      };

  int evaluateHabitCreatedScore() => _habitCreatedScore;

  // --- CHECK IN ---

  int evaluateCheckInsScore(CheckInCoutingData countingData) => countingData
      .checkIns
      .entries
      .fold<double>(
        0,
        (sum, entry) =>
            sum + entry.value * evaluateSingleCheckInScore(entry.key),
      )
      .floor();

  int evaluateSingleCheckInScore(CheckInStreakPeriod streakPeriod) =>
      switch (streakPeriod) {
        CheckInStreakPeriod.fewDays => 3,
        CheckInStreakPeriod.fewWeeks => 4,
        CheckInStreakPeriod.fewMonths => 5,
        CheckInStreakPeriod.longTime => 7,
      };
}
