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
        style: FilledButton.styleFrom(padding: const EdgeInsets.all(16)),
        icon: const Icon(Icons.calendar_today_rounded),
        label: Text(
          NzDateTimeFormat.relativeLocalFormat(dateValue),
          // ,
        ),
      );
    }

    return OutlinedButton.icon(
      onPressed: () => _selectDay(context),
      style: OutlinedButton.styleFrom(padding: const EdgeInsets.all(16)),
      icon: const Icon(Icons.alarm_off_rounded),
      label: Text(t.tasks.edit.fields.taskForSomeday),
    );
  }

  Future<void> _selectDay(BuildContext context) async {
    final today = DateTime.now();
    final newValue = await showDatePicker(
      context: context,
      initialDate: value,
      currentDate: today,
      firstDate: today,
      lastDate: today.add(const Duration(days: 365)),
    );

    if (newValue == null) return;
    onChanged(newValue);
  }
}
