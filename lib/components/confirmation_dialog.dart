import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero/i18n/translations.g.dart';

Future<bool?> showConfirmationDialog(
  BuildContext context, {
  String? title,
  String? content,
  String? cancel,
  String? confirm,
  bool dangerous = false,
}) {
  return showDialog<bool>(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(title ?? t.common.dialog.confirmTitle),
      content: content != null ? Text(content) : null,
      actions: [
        TextButton(
          onPressed: () => GoRouter.of(context).pop(false),
          // TODO(uSlashVlad): Add tooltip.
          child: Text(cancel ?? t.common.dialog.cancelButton),
        ),
        TextButton(
          onPressed: () => GoRouter.of(context).pop(true),
          // TODO(uSlashVlad): Add tooltip.
          child: Text(
            confirm ?? t.common.dialog.okButton,
            style: dangerous
                ? TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontWeight: FontWeight.bold,
                  )
                : null,
          ),
        ),
      ],
    ),
  );
}
