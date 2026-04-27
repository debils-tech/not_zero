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

part 'notification_action_category.freezed.dart';

@freezed
abstract class NotificationActionCategory with _$NotificationActionCategory {
  const factory NotificationActionCategory({
    required String id,
    required List<NotificationAction> actions,
  }) = _NotificationActionCategory;
}

@freezed
abstract class NotificationAction with _$NotificationAction {
  const factory NotificationAction({
    required String id,
    required String label,
    @Default(false) bool isDestructive,
    @Default(false) bool requiresForeground,
  }) = _NotificationAction;
}
