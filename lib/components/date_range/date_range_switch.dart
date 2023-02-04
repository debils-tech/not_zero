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
  late DateTime currentDate;

  DateTime get rangeStart => currentDate.startOfWeek;

  DateTime get rangeEnd => currentDate.endOfWeek;

  @override
  void initState() {
    currentDate = widget.initialDate ?? DateTime.now();
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
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: Theme.of(context).dividerColor),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 230),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: _DateRangeText(rangeStart, rangeEnd),
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

  void _previousRange() {
    setState(() {
      currentDate = currentDate.weekBefore;
    });
    widget.onChanged?.call(rangeStart, rangeEnd);
  }

  void _nextRange() {
    setState(() {
      currentDate = currentDate.weekAfter;
    });
    widget.onChanged?.call(rangeStart, rangeEnd);
  }
}

class _DateRangeText extends StatelessWidget {
  const _DateRangeText(this.rangeStart, this.rangeEnd);

  final DateTime rangeStart;
  final DateTime rangeEnd;

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
      style: const TextStyle(fontSize: 17),
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
