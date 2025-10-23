import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nz_common/nz_common.dart';
import 'package:nz_flutter_core/src/translations/translations.g.dart';

abstract final class NzDateTimeFormat {
  static String relativeLocalFormat(
    BuildContext context,
    DateTime dateTime, {
    DateTime? dateToCompare,
    dynamic locale,
  }) {
    dateToCompare ??= DateTime.now();

    // If today
    if (dateTime.isAtSameDay(dateToCompare)) {
      return context.t.common.timeOptions.today;
    }
    // If yesterday
    if (dateTime.isAtSameDay(dateToCompare.dayBefore)) {
      return context.t.common.timeOptions.yesterday;
    }
    // If tomorrow
    if (dateTime.isAtSameDay(dateToCompare.dayAfter)) {
      return context.t.common.timeOptions.tomorrow;
    }

    return localFormat(dateTime, dateToCompare: dateToCompare, locale: locale);
  }

  static String localFormat(
    DateTime dateTime, {
    DateTime? dateToCompare,
    dynamic locale,
  }) {
    dateToCompare ??= DateTime.now();

    // If the same day
    if (dateTime.isAtSameDay(dateToCompare)) {
      return DateFormat.Hm().format(dateTime);
    }
    // If the same year
    if (dateTime.isAtSameYear(dateToCompare)) {
      return DateFormat.MMMMd().format(dateTime);
    }
    // If even years are different
    return DateFormat.yMMMd().format(dateTime);
  }

  static String rangeLocalFormat(
    DateTime rangeStart,
    DateTime rangeEnd, {
    dynamic locale,
  }) {
    // If the same month (add month at the end)
    if (rangeStart.isAtSameMonth(rangeEnd)) {
      final start = DateFormat.d().format(rangeStart);
      final end = DateFormat.MMMd().format(rangeEnd);
      return '$start - $end';
    }
    // If the same year (add month to each side)
    if (rangeStart.isAtSameYear(rangeEnd)) {
      final start = DateFormat.MMMd().format(rangeStart);
      final end = DateFormat.MMMd().format(rangeEnd);
      return '$start - $end';
    }
    // If even years are different (add year to each side)
    final start = DateFormat.yMMMd().format(rangeStart);
    final end = DateFormat.yMMMd().format(rangeEnd);
    return '$start - $end';
  }
}
