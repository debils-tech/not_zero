import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nz_flutter_core/src/translations/translations.g.dart';

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
          onPressed: () => context.pop(false),
          child: Text(cancel ?? t.common.dialog.cancelButton),
        ),
        TextButton(
          onPressed: () => context.pop(true),
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
