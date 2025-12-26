// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2025 Nagorny Vladislav
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero_app/src/features/translations/translations.g.dart';
import 'package:not_zero_app/src/helpers/build_context_quick_access_ext.dart';

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
                    fontWeight: .bold,
                  )
                : null,
          ),
        ),
      ],
    ),
  );
}
