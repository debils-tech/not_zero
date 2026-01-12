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

import 'package:nz_boxes/nz_boxes.dart';
import 'package:nz_common/nz_common.dart';

class SchedulesLocalService implements BaseService {
  const SchedulesLocalService(this._tempBox);

  final NotZeroSimpleBox _tempBox;

  static const _lastHabitsRemindersSchedulingKey =
      'lastHabitsRemindersScheduling';

  DateTime? getLastHabitsReminderScheduling() {
    final stringValue = _tempBox.getString(_lastHabitsRemindersSchedulingKey);
    if (stringValue == null) return null;

    return DateTime.tryParse(stringValue);
  }

  Future<void> setLastHabitsReminderScheduling(DateTime state) {
    return _tempBox.putString(
      _lastHabitsRemindersSchedulingKey,
      state.toIso8601String(),
    );
  }
}
