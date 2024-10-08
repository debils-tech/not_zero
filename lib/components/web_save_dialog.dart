// coverage:ignore-file
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero/components/common_widgets/copy_button.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class WebSaveDialog extends StatelessWidget {
  const WebSaveDialog(this.stringContent, {super.key});

  final String stringContent;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(t.common.dialog.webSaveTitle),
            const SizedBox(height: 10),
            Container(
              height: MediaQuery.of(context).size.height - 200,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.fromBorderSide(
                  BorderSide(color: Theme.of(context).disabledColor),
                ),
              ),
              padding: const EdgeInsets.all(6),
              child: SelectableText(
                stringContent,
                style: const TextStyle(fontFamily: 'SourceCodePro'),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                ElevatedCopyButton(stringContent),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: context.pop,
                  child: Text(t.common.dialog.cancelButton),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
