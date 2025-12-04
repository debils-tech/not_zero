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

part 'quick_statistics_state.freezed.dart';

@freezed
abstract class QuickStatisticsState with _$QuickStatisticsState {
  const factory QuickStatisticsState({
    List<int>? chartStats,
    DateTime? chartRangeStart,
    DateTime? chartRangeEnd,
    int? selectedDayIndex,
  }) = _QuickStatisticsState;

  const QuickStatisticsState._();
}
