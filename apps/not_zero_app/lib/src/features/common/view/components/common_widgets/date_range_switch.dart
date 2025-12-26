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

import 'package:flutter/material.dart';
import 'package:not_zero_app/src/helpers/nz_date_time_format.dart';
import 'package:nz_common/nz_common.dart';

enum DateRangeType { day, week }

class DateRangeSwitch extends StatefulWidget {
  const DateRangeSwitch({
    required this.rangeType,
    this.initialDate,
    this.onChanged,
    super.key,
  });

  final DateRangeType rangeType;
  final DateTime? initialDate;
  final void Function(DateTime rangeStart, DateTime rangeEInd)? onChanged;

  @override
  State<DateRangeSwitch> createState() => _DateRangeSwitchState();
}

class _DateRangeSwitchState extends State<DateRangeSwitch> {
  late DateTime _currentDate;

  DateTime get _rangeStart => switch (widget.rangeType) {
    .day => _currentDate.startOfDay,
    .week => _currentDate.startOfWeek,
  };

  DateTime get _rangeEnd => switch (widget.rangeType) {
    .day => _currentDate.endOfDay,
    .week => _currentDate.endOfWeek,
  };

  @override
  void initState() {
    _currentDate = widget.initialDate ?? .now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        IconButton(
          onPressed: _previousRange,
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 230),
            child: _MiddleButton(
              onTap: _todayRange,
              onLongPress: widget.rangeType == .day
                  ? _selectCalendarRange
                  : null,
              rangeStart: _rangeStart,
              rangeEnd: _rangeEnd,
            ),
          ),
        ),
        const SizedBox(width: 4),
        IconButton(
          onPressed: _nextRange,
          icon: const Icon(Icons.arrow_forward_ios_rounded),
        ),
      ],
    );
  }

  void _todayRange() {
    setState(() {
      _currentDate = .now();
    });
    widget.onChanged?.call(_rangeStart, _rangeEnd);
  }

  void _previousRange() {
    final newDate = switch (widget.rangeType) {
      .day => _currentDate.dayBefore,
      .week => _currentDate.weekBefore,
    };
    setState(() {
      _currentDate = newDate;
    });
    widget.onChanged?.call(_rangeStart, _rangeEnd);
  }

  void _nextRange() {
    final newDate = switch (widget.rangeType) {
      .day => _currentDate.dayAfter,
      .week => _currentDate.weekAfter,
    };
    setState(() {
      _currentDate = newDate;
    });
    widget.onChanged?.call(_rangeStart, _rangeEnd);
  }

  Future<void> _selectCalendarRange() async {
    final today = DateTime.now();
    final firstDate = today.subtract(const Duration(days: 365));
    final lastDate = today.add(const Duration(days: 365));
    final newDate = await showDatePicker(
      context: context,
      initialDate: _currentDate.isBefore(firstDate)
          ? firstDate
          : (_currentDate.isAfter(lastDate) ? lastDate : _currentDate),
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (newDate == null) return;

    setState(() {
      _currentDate = newDate;
    });
    widget.onChanged?.call(_rangeStart, _rangeEnd);
  }
}

class _MiddleButton extends StatelessWidget {
  const _MiddleButton({
    required this.onTap,
    required this.rangeStart,
    required this.rangeEnd,
    this.onLongPress,
  });

  final void Function() onTap;
  final void Function()? onLongPress;

  final DateTime rangeStart;
  final DateTime rangeEnd;

  bool get _isTodayInRange {
    final today = DateTime.now();
    return today.isAfter(rangeStart) && today.isBefore(rangeEnd);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final String text;

    if (rangeStart.isAtSameDay(rangeEnd)) {
      text = NzDateTimeFormat.relativeLocalFormat(context, rangeStart);
    } else {
      text = NzDateTimeFormat.rangeLocalFormat(rangeStart, rangeEnd);
    }

    return OutlinedButton(
      onPressed: onTap,
      onLongPress: onLongPress,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        foregroundColor: _isTodayInRange
            ? theme.colorScheme.primary
            : theme.colorScheme.onSurface,
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Text(text, style: const TextStyle(fontSize: 17)),
      ),
    );
  }
}
