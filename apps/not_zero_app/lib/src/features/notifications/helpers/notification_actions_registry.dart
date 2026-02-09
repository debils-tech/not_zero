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

import 'package:collection/collection.dart';
import 'package:not_zero_app/src/features/notifications/constants/notification_action_ids.dart';
import 'package:not_zero_app/src/features/notifications/models/notification_action_category.dart';
import 'package:not_zero_app/src/features/translations/translations.g.dart';

abstract final class NotificationActionsRegistry {
  static List<NotificationActionCategory> get categories => [
    NotificationActionCategory(
      id: NotificationCategoryIds.reminder,
      actions: [
        NotificationAction(
          id: NotificationActionIds.complete,
          label: t.common.notifications.actions.complete,
        ),
      ],
    ),
  ];

  static NotificationActionCategory? getCategory(String? id) {
    if (id == null) return null;
    return categories.firstWhereOrNull((element) => element.id == id);
  }
}
