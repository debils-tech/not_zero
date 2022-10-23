import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_zero/components/common_widgets/universal_list_view.dart';
import 'package:not_zero/components/selection/bloc/selection_bloc.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/i18n/strings.g.dart';
import 'package:not_zero/units/notes/domain/models/note.dart';
import 'package:not_zero/units/notes/presentation/view/components/note_card.dart';

class NotesListScreen extends StatelessWidget {
  const NotesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<ItemSelectionBloc>(),
        )
      ],
      child: Scaffold(
        appBar: AppBar(title: Text(t.notes.list.title)),
        body: const _NotesListBody(),
      ),
    );
  }
}

class _NotesListBody extends StatelessWidget {
  const _NotesListBody();

  @override
  Widget build(BuildContext context) {
    final listKey = GlobalKey();

    return UniversalListView<Note>(
      listKey: listKey,
      items: [Note.create(text: 'Hello World!')],
      itemBuilder: (_, item, __) => NoteCard(item),
    );
  }
}
