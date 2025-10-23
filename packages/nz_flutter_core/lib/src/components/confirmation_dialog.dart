import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nz_flutter_core/src/translations/translations.g.dart';
import 'package:nz_flutter_core/src/utils/build_context_quick_access_ext.dart';

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
      title: Text(title ?? context.t.common.dialog.confirmTitle),
      content: content != null ? Text(content) : null,
      actions: [
        TextButton(
          onPressed: () => context.pop(false),
          child: Text(cancel ?? context.t.common.dialog.cancelButton),
        ),
        TextButton(
          onPressed: () => context.pop(true),
          child: Text(
            confirm ?? context.t.common.dialog.okButton,
            style: dangerous
                ? TextStyle(
                    color: context.theme.colorScheme.error,
                    fontWeight: FontWeight.bold,
                  )
                : null,
          ),
        ),
      ],
    ),
  );
}
