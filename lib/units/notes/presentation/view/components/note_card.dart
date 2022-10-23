import 'package:flutter/material.dart';
import 'package:not_zero/components/selection/widgets/selectable_card.dart';
import 'package:not_zero/helpers/time.dart';
import 'package:not_zero/i18n/strings.g.dart';
import 'package:not_zero/units/notes/domain/models/note.dart';

class NoteCard extends StatelessWidget {
  const NoteCard(this.note, {super.key});

  final Note note;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SelectableCard(
      identifier: note.id,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _NoteTimeText(note),
            Text(
              note.title ?? note.lines.first,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleMedium!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
                vertical: 2,
              ),
              child: Text(
                note.text,
                style: theme.textTheme.caption!
                    .copyWith(fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NoteTimeText extends StatelessWidget {
  const _NoteTimeText(this.note);

  final Note note;

  @override
  Widget build(BuildContext context) {
    final timeToShow = note.modifiedAt ?? note.createdAt;

    final formattedTime = timeToShow.localFormat();

    final ts = t.common.timeSubtitle;
    final String finalTextTime;
    if (note.modifiedAt != null) {
      finalTextTime = ts.modifiedAt(time: formattedTime);
    } else {
      finalTextTime = ts.createdAt(time: formattedTime);
    }

    return Text(
      finalTextTime,
      style: Theme.of(context).textTheme.subtitle2,
    );
  }
}
