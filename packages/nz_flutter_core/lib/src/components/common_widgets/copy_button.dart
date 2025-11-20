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

// coverage:ignore-file
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class ElevatedCopyButton extends StatefulWidget {
  const ElevatedCopyButton(
    this.content, {
    super.key,
    this.defaultCopyText,
    this.copiedText,
  });

  final String content;

  final String? defaultCopyText;
  final String? copiedText;

  @override
  State<ElevatedCopyButton> createState() => _ElevatedCopyButtonState();
}

class _ElevatedCopyButtonState extends State<ElevatedCopyButton> {
  var _isCopied = false;

  Timer? _resetTimer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: ElevatedButton(
        onPressed: () {
          unawaited(Clipboard.setData(ClipboardData(text: widget.content)));

          setState(() => _isCopied = true);

          _resetTimer?.cancel();
          _resetTimer = Timer(
            const Duration(milliseconds: 2000),
            () => setState(() => _isCopied = false),
          );
        },
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: _isCopied
              ? Text(widget.copiedText ?? context.t.common.copy.completedText)
              : Text(
                  widget.defaultCopyText ?? context.t.common.copy.defaultText,
                ),
        ),
      ),
    );
  }
}
