import 'package:flutter/material.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class FancyDatePickerButton extends StatelessWidget {
  const FancyDatePickerButton({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final DateTime? value;
  final ValueSetter<DateTime> onChanged;

  @override
  Widget build(BuildContext context) {
    final dateValue = value;

    if (dateValue != null) {
      return FilledButton.tonalIcon(
        onPressed: () => _selectDay(context),
        style: FilledButton.styleFrom(padding: const .all(16)),
        icon: const Icon(Icons.calendar_today_rounded),
        label: Text(
          NzDateTimeFormat.relativeLocalFormat(context, dateValue),
        ),
      );
    }

    return OutlinedButton.icon(
      onPressed: () => _selectDay(context),
      style: OutlinedButton.styleFrom(padding: const .all(16)),
      icon: const Icon(Icons.alarm_off_rounded),
      label: Text(context.t.tasks.edit.fields.taskForSomeday),
    );
  }

  Future<void> _selectDay(BuildContext context) async {
    final today = DateTime.now();
    final pickedDate = value;

    // TODO(uSlashVlad): Maybe it would be better to place date picker in the navigation as a usual dialog page?
    final newValue = await showDatePicker(
      context: context,
      // TODO(uSlashVlad): Couldn't pick date in the past, maybe some fix needed
      initialDate: pickedDate != null && today.isAfter(pickedDate)
          ? today
          : pickedDate,
      currentDate: today,
      firstDate: today,
      lastDate: today.add(const Duration(days: 365)),
    );

    if (newValue == null) return;
    onChanged(newValue);
  }
}
