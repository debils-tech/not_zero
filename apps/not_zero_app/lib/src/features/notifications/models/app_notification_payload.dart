// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2026 Nagorny Vladislav
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

part 'app_notification_payload.freezed.dart';
part 'app_notification_payload.g.dart';

@freezed
sealed class AppNotificationPayload with _$AppNotificationPayload {
  const factory AppNotificationPayload.loginReminder() =
      AppNotificationPayloadLoginReminder;

  const factory AppNotificationPayload.taskReminder({
    required String taskId,
    DateTime? forDateTime,
  }) = AppNotificationPayloadTaskReminder;

  const factory AppNotificationPayload.habitReminder({
    required String habitId,
    DateTime? forDateTime,
  }) = AppNotificationPayloadHabitReminder;

  factory AppNotificationPayload.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationPayloadFromJson(json);
}
