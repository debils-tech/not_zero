import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/helpers/date_transformations.dart';

const oneMicrosend = Duration(microseconds: 1);

void main() {
  final niceDay = DateTime(2022, 02, 02, 11, 34, 123, 456); // wednesday btw

  group('Starts and ends', () {
    test('Start and end of day', () {
      expect(niceDay.startOfDay, DateTime(2022, 02, 02));

      expect(
        niceDay.endOfDay,
        DateTime(2022, 02, 02, 23, 59, 59, 999, 999),
      );
    });

    test('Start and end of week', () {
      expect(niceDay.startOfWeek, DateTime(2022, 01, 31));

      expect(
        niceDay.endOfWeek,
        DateTime(2022, 02, 06, 23, 59, 59, 999, 999),
      );
    });

    test('Start and end of month', () {
      expect(niceDay.startOfMonth, DateTime(2022, 02));

      expect(
        niceDay.endOfMonth,
        DateTime(2022, 02, 28, 23, 59, 59, 999, 999),
      );
    });
  });

  group('Days shift', () {
    test('Just week before', () {
      expect(
        niceDay.weekBefore,
        DateTime(
          2022,
          1,
          26,
          niceDay.hour,
          niceDay.minute,
          niceDay.second,
          niceDay.millisecond,
          niceDay.microsecond,
        ),
      );
    });

    test('Just week after', () {
      expect(
        niceDay.weekAfter,
        DateTime(
          2022,
          2,
          9,
          niceDay.hour,
          niceDay.minute,
          niceDay.second,
          niceDay.millisecond,
          niceDay.microsecond,
        ),
      );
    });

    test('Range week before', () {
      expect(niceDay.startOfWeek.weekBefore, DateTime(2022, 1, 24));

      expect(
        niceDay.endOfWeek.weekBefore,
        DateTime(2022, 1, 30, 23, 59, 59, 999, 999),
      );
    });

    test('Just day after', () {
      expect(
        niceDay.dayAfter,
        DateTime(
          2022,
          2,
          3,
          niceDay.hour,
          niceDay.minute,
          niceDay.second,
          niceDay.millisecond,
          niceDay.microsecond,
        ),
      );
    });

    test('Day after on month border', () {
      expect(
        DateTime(2022, 2, 28).dayAfter,
        DateTime(2022, 3),
      );
    });
  });
}
