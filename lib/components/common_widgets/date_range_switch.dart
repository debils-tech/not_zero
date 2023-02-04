import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:not_zero/helpers/date_transformations.dart';

class DateRangeSwitch extends StatefulWidget {
  const DateRangeSwitch({super.key, this.initialDate, this.onChanged});

  final DateTime? initialDate;
  final void Function(DateTime rangeStart, DateTime rangeEInd)? onChanged;

  @override
  State<DateRangeSwitch> createState() => _DateRangeSwitchState();
}

class _DateRangeSwitchState extends State<DateRangeSwitch> {
  late DateTime _currentDate;

  DateTime get _rangeStart => _currentDate.startOfWeek;
  DateTime get _rangeEnd => _currentDate.endOfWeek;

  @override
  void initState() {
    _currentDate = widget.initialDate ?? DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: _previousRange,
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        const SizedBox(width: 4),
        _MiddleButton(
          onTap: _todayRange,
          rangeStart: _rangeStart,
          rangeEnd: _rangeEnd,
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
      _currentDate = DateTime.now();
    });
    widget.onChanged?.call(_rangeStart, _rangeEnd);
  }

  void _previousRange() {
    setState(() {
      _currentDate = _currentDate.weekBefore;
    });
    widget.onChanged?.call(_rangeStart, _rangeEnd);
  }

  void _nextRange() {
    setState(() {
      _currentDate = _currentDate.weekAfter;
    });
    widget.onChanged?.call(_rangeStart, _rangeEnd);
  }
}

class _MiddleButton extends StatelessWidget {
  const _MiddleButton({
    required this.onTap,
    required this.rangeStart,
    required this.rangeEnd,
  });

  final void Function() onTap;

  final DateTime rangeStart;
  final DateTime rangeEnd;

  bool get _isTodayInRange {
    final today = DateTime.now();
    return today.isAfter(rangeStart) && today.isBefore(rangeEnd);
  }

  @override
  Widget build(BuildContext context) {
    const radius = BorderRadius.all(Radius.circular(20));

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: DecoratedBox(
          key: ValueKey('$rangeStart $rangeEnd'),
          decoration: BoxDecoration(
            borderRadius: radius,
            border: Border.all(color: Theme.of(context).dividerColor),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 230),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: _DateRangeText(
                rangeStart,
                rangeEnd,
                isSelected: _isTodayInRange,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DateRangeText extends StatelessWidget {
  const _DateRangeText(
    this.rangeStart,
    this.rangeEnd, {
    this.isSelected = false,
  });

  final DateTime rangeStart;
  final DateTime rangeEnd;

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final String text;

    if (rangeStart.month == rangeEnd.month) {
      text = _formatSameMonth();
    } else if (rangeStart.year == rangeEnd.year) {
      text = _formatSameYear();
    } else {
      text = _formatFull();
    }

    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 17,
        color: isSelected ? Theme.of(context).colorScheme.primary : null,
      ),
    );
  }

  String _formatSameMonth() {
    final start = DateFormat.d().format(rangeStart);
    final end = DateFormat.d().format(rangeEnd);
    final month = DateFormat.MMM().format(rangeStart);
    return '$start - $end $month';
  }

  String _formatSameYear() {
    final start = DateFormat.MMMd().format(rangeStart);
    final end = DateFormat.MMMd().format(rangeEnd);
    final year = rangeStart.year.toString();
    return '$start - $end $year';
  }

  String _formatFull() {
    final start = DateFormat.yMMMd().format(rangeStart);
    final end = DateFormat.yMMMd().format(rangeEnd);
    return '$start - $end';
  }
}
