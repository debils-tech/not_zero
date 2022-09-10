import 'package:flutter/material.dart';
import 'package:not_zero/i18n/strings.g.dart';

Future<bool?> showConfirmationDialog(
  BuildContext context, {
  String? title,
  String? content,
  String? cancel,
  String? confirm,
  bool dangerous = false,
}) {
  final dialog = AlertDialog(
    title: Text(title ?? t.common.dialog.confirmTitle),
    content: content != null ? Text(content) : null,
    actions: [
      TextButton(
        onPressed: () => Navigator.of(context).pop(false),
        child: Text(cancel ?? t.common.dialog.cancelButton),
      ),
      TextButton(
        onPressed: () => Navigator.of(context).pop(true),
        child: Text(
          confirm ?? t.common.dialog.okButton,
          style: dangerous
              ? TextStyle(
                  color: Theme.of(context).errorColor,
                )
              : null,
        ),
      ),
    ],
  );

  return showDialog<bool>(context: context, builder: (_) => dialog);
}
