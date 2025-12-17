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

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'app_daily_check_in.freezed.dart';
part 'app_daily_check_in.g.dart';

@freezed
abstract class AppDailyCheckIn with _$AppDailyCheckIn {
  const factory AppDailyCheckIn({
    required String id,
    required DateTime checkInDate,
    @Default(1) int streakCount,
  }) = _AppDailyCheckIn;

  factory AppDailyCheckIn.create({
    required DateTime checkInDate,
    required int streakCount,
  }) => AppDailyCheckIn(
    id: const Uuid().v4(),
    checkInDate: checkInDate,
    streakCount: streakCount,
  );

  factory AppDailyCheckIn.fromJson(Map<String, dynamic> json) =>
      _$AppDailyCheckInFromJson(json);
}
