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
