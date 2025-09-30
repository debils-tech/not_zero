import 'package:flutter/material.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class FancyDatePickerButton extends StatelessWidget {
  const FancyDatePickerButton({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final DateTime value;
  final ValueSetter<DateTime> onChanged;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () async {
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
      },
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(16),
      ),
      icon: const Icon(Icons.calendar_month_rounded),
      label: Text(
        NzDateTimeFormat.relativeLocalFormat(value),
      ),
    );
  }
}
