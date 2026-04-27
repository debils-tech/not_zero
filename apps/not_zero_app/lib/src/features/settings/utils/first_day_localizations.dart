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

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FirstDayLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FirstDayLocalizationsDelegate(this.firstDayOfWeekIndex);

  /// Same convention as [MaterialLocalizations.firstDayOfWeekIndex]:
  /// Sunday is 0, Monday is 1, ... Saturday is 6.
  final int firstDayOfWeekIndex;

  @override
  bool isSupported(Locale locale) {
    return GlobalMaterialLocalizations.delegate.isSupported(locale);
  }

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    final localizations = await GlobalMaterialLocalizations.delegate.load(
      locale,
    );
    return _FirstDayMaterialLocalizations(
      localizations,
      firstDayOfWeekIndex,
    );
  }

  @override
  bool shouldReload(FirstDayLocalizationsDelegate old) {
    return old.firstDayOfWeekIndex != firstDayOfWeekIndex;
  }
}

class _FirstDayMaterialLocalizations implements MaterialLocalizations {
  const _FirstDayMaterialLocalizations(
    this._inner,
    this.firstDayOfWeekIndex,
  );

  final MaterialLocalizations _inner;

  @override
  final int firstDayOfWeekIndex;

  @override
  List<String> get narrowWeekdays => _inner.narrowWeekdays;

  @override
  String get cancelButtonLabel => _inner.cancelButtonLabel;

  @override
  String get okButtonLabel => _inner.okButtonLabel;

  @override
  String get inputDateModeButtonLabel => _inner.inputDateModeButtonLabel;

  @override
  String get calendarModeButtonLabel => _inner.calendarModeButtonLabel;

  @override
  String get datePickerHelpText => _inner.datePickerHelpText;

  @override
  String get previousMonthTooltip => _inner.previousMonthTooltip;

  @override
  String get nextMonthTooltip => _inner.nextMonthTooltip;

  @override
  String get currentDateLabel => _inner.currentDateLabel;

  @override
  String get selectedDateLabel => _inner.selectedDateLabel;

  @override
  String get selectYearSemanticsLabel => _inner.selectYearSemanticsLabel;

  @override
  String get invalidDateFormatLabel => _inner.invalidDateFormatLabel;

  @override
  String get dateOutOfRangeLabel => _inner.dateOutOfRangeLabel;

  @override
  String get dateInputLabel => _inner.dateInputLabel;

  @override
  String get dateHelpText => _inner.dateHelpText;

  @override
  String get dateSeparator => _inner.dateSeparator;

  @override
  ScriptCategory get scriptCategory => _inner.scriptCategory;

  @override
  String formatDecimal(int number) => _inner.formatDecimal(number);

  @override
  String formatMediumDate(DateTime date) => _inner.formatMediumDate(date);

  @override
  String formatFullDate(DateTime date) => _inner.formatFullDate(date);

  @override
  String formatMonthYear(DateTime date) => _inner.formatMonthYear(date);

  @override
  String formatYear(DateTime date) => _inner.formatYear(date);

  @override
  String formatCompactDate(DateTime date) => _inner.formatCompactDate(date);

  @override
  DateTime? parseCompactDate(String? inputString) {
    return _inner.parseCompactDate(inputString);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) {
    return _inner.noSuchMethod(invocation);
  }
}
