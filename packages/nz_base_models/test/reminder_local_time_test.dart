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

import 'package:nz_base_models/nz_base_models.dart';
import 'package:test/test.dart';

void main() {
  group('ReminderLocalTime.toString()', () {
    test('Regular local time with UTC to string', () {
      const reminderTime = ReminderLocalTime(12, 23, timezoneOffset: 0);
      final string = reminderTime.toString();
      expect(string, equals('12:23T0:00'));
    });

    test('Regular local time with padding and UTC to string', () {
      const reminderTime = ReminderLocalTime(8, 5, timezoneOffset: 0);
      final string = reminderTime.toString();
      expect(string, equals('08:05T0:00'));
    });

    test('Regular local time with positive timezone small to string', () {
      const reminderTime = ReminderLocalTime(12, 23, timezoneOffset: 3);
      final string = reminderTime.toString();
      expect(string, equals('12:23T3:00'));
    });

    test('Regular local time with positive timezone big to string', () {
      const reminderTime = ReminderLocalTime(12, 23, timezoneOffset: 14);
      final string = reminderTime.toString();
      expect(string, equals('12:23T14:00'));
    });

    test('Regular local time with negative timezone small to string', () {
      const reminderTime = ReminderLocalTime(12, 23, timezoneOffset: -5);
      final string = reminderTime.toString();
      expect(string, equals('12:23T-5:00'));
    });

    test('Regular local time with negative timezone big to string', () {
      const reminderTime = ReminderLocalTime(12, 23, timezoneOffset: -12);
      final string = reminderTime.toString();
      expect(string, equals('12:23T-12:00'));
    });

    test('Local time with positive fractional timezone to string', () {
      const reminderTime = ReminderLocalTime(12, 23, timezoneOffset: 8.75);
      final string = reminderTime.toString();
      expect(string, equals('12:23T8:45'));
    });

    test('Local time with big positive fractional timezone to string', () {
      const reminderTime = ReminderLocalTime(12, 23, timezoneOffset: 10.5);
      final string = reminderTime.toString();
      expect(string, equals('12:23T10:30'));
    });

    test('Local time with negative fractional timezone to string', () {
      const reminderTime = ReminderLocalTime(12, 23, timezoneOffset: -3.5);
      final string = reminderTime.toString();
      expect(string, equals('12:23T-4:30'));
    });
  });

  group('ReminderLocalTime.fromString()', () {
    test('Regular local time with UTC from string', () {
      final reminderTime = ReminderLocalTime.fromString('12:23T0:00');
      expect(reminderTime.hour, equals(12));
      expect(reminderTime.minute, equals(23));
      expect(reminderTime.timezoneOffset, equals(0));
    });

    test('Regular local time with padding and UTC from string', () {
      final reminderTime = ReminderLocalTime.fromString('08:05T0:00');
      expect(reminderTime.hour, equals(8));
      expect(reminderTime.minute, equals(5));
      expect(reminderTime.timezoneOffset, equals(0));
    });

    test('Regular local time with positive timezone small from string', () {
      final reminderTime = ReminderLocalTime.fromString('12:23T3:00');
      expect(reminderTime.hour, equals(12));
      expect(reminderTime.minute, equals(23));
      expect(reminderTime.timezoneOffset, equals(3));
    });

    test('Regular local time with positive timezone big from string', () {
      final reminderTime = ReminderLocalTime.fromString('12:23T14:00');
      expect(reminderTime.hour, equals(12));
      expect(reminderTime.minute, equals(23));
      expect(reminderTime.timezoneOffset, equals(14));
    });

    test('Regular local time with negative timezone small from string', () {
      final reminderTime = ReminderLocalTime.fromString('12:23T-5:00');
      expect(reminderTime.hour, equals(12));
      expect(reminderTime.minute, equals(23));
      expect(reminderTime.timezoneOffset, equals(-5));
    });

    test('Regular local time with negative timezone big from string', () {
      final reminderTime = ReminderLocalTime.fromString('12:23T-12:00');
      expect(reminderTime.hour, equals(12));
      expect(reminderTime.minute, equals(23));
      expect(reminderTime.timezoneOffset, equals(-12));
    });

    test('Local time with positive fractional timezone from string', () {
      final reminderTime = ReminderLocalTime.fromString('12:23T8:45');
      expect(reminderTime.hour, equals(12));
      expect(reminderTime.minute, equals(23));
      expect(reminderTime.timezoneOffset, equals(8.75));
    });

    test('Local time with big positive fractional timezone from string', () {
      final reminderTime = ReminderLocalTime.fromString('12:23T10:30');
      expect(reminderTime.hour, equals(12));
      expect(reminderTime.minute, equals(23));
      expect(reminderTime.timezoneOffset, equals(10.5));
    });

    test('Local time with negative fractional timezone from string', () {
      final reminderTime = ReminderLocalTime.fromString('12:23T-4:30');
      expect(reminderTime.hour, equals(12));
      expect(reminderTime.minute, equals(23));
      expect(reminderTime.timezoneOffset, equals(-3.5));
    });

    test('Throws FormatException when local time hours are not int', () {
      expect(
        () => ReminderLocalTime.fromString('xx:00T00:00'),
        throwsFormatException,
      );
    });

    test('Throws FormatException when local time minutes are not int', () {
      expect(
        () => ReminderLocalTime.fromString('12:xxT00:00'),
        throwsFormatException,
      );
    });

    test('Throws FormatException when offset hours are not int', () {
      expect(
        () => ReminderLocalTime.fromString('12:00Txx:00'),
        throwsFormatException,
      );
    });

    test('Throws FormatException when offset minutes are not int', () {
      expect(
        () => ReminderLocalTime.fromString('12:00T00:xx'),
        throwsFormatException,
      );
    });
  });

  group('ReminderLocalTime.toUtc()', () {
    test('Regular positive timezone case to UTC', () {
      const reminderTime = ReminderLocalTime(10, 10, timezoneOffset: 3);
      final utcTime = reminderTime.toUtc();
      expect(utcTime.hour, equals(7));
      expect(utcTime.minute, equals(10));
      expect(utcTime.timezoneOffset, equals(0));
    });

    test('Regular negative timezone case to UTC', () {
      const reminderTime = ReminderLocalTime(10, 10, timezoneOffset: -3);
      final utcTime = reminderTime.toUtc();
      expect(utcTime.hour, equals(13));
      expect(utcTime.minute, equals(10));
      expect(utcTime.timezoneOffset, equals(0));
    });

    test('Zero timezone case to UTC', () {
      const reminderTime = ReminderLocalTime(10, 10, timezoneOffset: 0);
      final utcTime = reminderTime.toUtc();
      expect(utcTime.hour, equals(10));
      expect(utcTime.minute, equals(10));
      expect(utcTime.timezoneOffset, equals(0));
    });

    test('Simple fractional timezone case to UTC', () {
      const reminderTime = ReminderLocalTime(10, 40, timezoneOffset: 3.5);
      final utcTime = reminderTime.toUtc();
      expect(utcTime.hour, equals(7));
      expect(utcTime.minute, equals(10));
      expect(utcTime.timezoneOffset, equals(0));
    });

    test('Fractional timezone case with negative minutes overflow to UTC', () {
      const reminderTime = ReminderLocalTime(10, 10, timezoneOffset: 3.5);
      final utcTime = reminderTime.toUtc();
      expect(utcTime.hour, equals(6));
      expect(utcTime.minute, equals(40));
      expect(utcTime.timezoneOffset, equals(0));
    });

    test('Fractional timezone case with positive minutes overflow to UTC', () {
      const reminderTime = ReminderLocalTime(6, 40, timezoneOffset: -3.5);
      final utcTime = reminderTime.toUtc();
      expect(utcTime.hour, equals(10));
      expect(utcTime.minute, equals(10));
      expect(utcTime.timezoneOffset, equals(0));
    });
  });
}
