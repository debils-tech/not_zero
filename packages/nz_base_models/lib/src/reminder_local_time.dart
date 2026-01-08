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

part 'reminder_local_time.freezed.dart';

@freezed
abstract class ReminderLocalTime with _$ReminderLocalTime {
  const factory ReminderLocalTime(
    int hour,
    int minute, {

    /// Timezone offset in hours
    required double timezoneOffset,
  }) = _ReminderLocalTime;

  factory ReminderLocalTime.create(int hour, int minute) {
    final currentTimezoneOffset = DateTime.now().timeZoneOffset;
    return ReminderLocalTime(
      hour,
      minute,
      timezoneOffset:
          currentTimezoneOffset.inHours +
          currentTimezoneOffset.minutesWithoutHours / Duration.minutesPerHour,
    );
  }

  const ReminderLocalTime._();

  factory ReminderLocalTime.fromString(String encoded) {
    assert(
      encoded.length >= 10 && encoded.length <= 12,
      'The shortest variant looks like "00:00T0:00" (10 symbols) '
      'and the longest variant looks like "00:00T-12:00" (12 symbols). '
      '${encoded.length} is not in this range',
    );
    final parts = encoded.split('T');
    assert(parts.length == 2, 'Should contain only 2 parts');
    final localTimePart = parts.firstOrNull;
    final timezonePart = parts.lastOrNull;
    if (localTimePart == null || timezonePart == null) {
      throw FormatException('Invalid encoding of reminder time: "$encoded"');
    }

    final (localHours, localMinutes) = _decodeTimePair(localTimePart);
    if (localHours == null || localMinutes == null) {
      throw FormatException(
        'Invalid encoding of local time. '
        '"hours:minutes" expected, "$localTimePart" received',
      );
    }

    final (offsetHours, offsetMinutes) = _decodeTimePair(timezonePart);
    if (offsetHours == null || offsetMinutes == null) {
      throw FormatException(
        'Invalid encoding of timezone offset. '
        '"hours:minutes" expected, "$timezonePart" received',
      );
    }

    return ReminderLocalTime(
      localHours,
      localMinutes,
      timezoneOffset: offsetHours + offsetMinutes / Duration.minutesPerHour,
    );
  }

  static (int?, int?) _decodeTimePair(String encodedPair) {
    final parts = encodedPair.split(':');
    assert(
      parts.length == 2,
      '2 components in time pair expected: "hours:minutes". '
      '${parts.length} components found',
    );
    return (
      int.tryParse(parts.firstOrNull ?? ''),
      int.tryParse(parts.lastOrNull ?? ''),
    );
  }

  @override
  String toString() =>
      '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}'
      'T$_hoursOffset:${_minutesOffset.toString().padLeft(2, '0')}';

  int get _hoursOffset => timezoneOffset.floor();

  int get _minutesOffset =>
      ((timezoneOffset - _hoursOffset) * Duration.minutesPerHour).truncate();

  /// Reminder time - timezone offset = UTC time
  ReminderLocalTime toUtc() => _addOffset(-_hoursOffset, -_minutesOffset);

  /// Reminder time - timezone offset + local timezone offset = local time
  ReminderLocalTime toLocal() {
    final currentTimezoneOffset = DateTime.now().timeZoneOffset;
    return toUtc()._addOffset(
      currentTimezoneOffset.inHours,
      currentTimezoneOffset.minutesWithoutHours,
    );
  }

  ReminderLocalTime _addOffset(int hoursOffset, int minutesOffset) {
    assert(
      hoursOffset >= -24 && hoursOffset <= 24,
      "Shouldn't offset on more than 1 day",
    );
    assert(
      minutesOffset > -60 && minutesOffset < 60,
      'Minutes offset should be within an hour',
    );

    // newMinutes can be negative, so we remove hours from the result time
    // Example: 19:10 - 10:30 results in 9 hours and -20 minutes
    // So we remove 1 hour, take remainder of minutes and end up with 8:40
    //
    // newMinutes also can be more than 60, so we add hours to the result time
    // Example: 8:40 + 10:30 results in 18 hours and 70 minutes
    // So we add 1 hour, take remainder of minutes and end up with 19:10
    final newMinutes = minute + minutesOffset;
    final newHours =
        hour + hoursOffset + (newMinutes / Duration.minutesPerHour).floor();

    return ReminderLocalTime(
      newHours % Duration.hoursPerDay,
      newMinutes % Duration.minutesPerHour,
      timezoneOffset:
          timezoneOffset +
          hoursOffset +
          minutesOffset / Duration.minutesPerHour,
    );
  }
}

extension on Duration {
  int get minutesWithoutHours => inMinutes - inHours * Duration.minutesPerHour;
}
