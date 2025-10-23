import 'package:flutter/material.dart';

class EverythingBrokeText extends StatelessWidget {
  const EverythingBrokeText(this.error, this.stackTrace, {super.key});

  final Object error;
  final StackTrace? stackTrace;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Center(
        child: SelectableText(
          '>>> ERROR HAPPENED <<<\n$error\n\n$stackTrace',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.error,
          ),
        ),
      ),
    );
  }
}
