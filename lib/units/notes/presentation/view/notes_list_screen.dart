import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero/components/common_widgets/universal_list_view.dart';
import 'package:not_zero/components/selection/bloc/selection_bloc.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/i18n/strings.g.dart';
import 'package:not_zero/units/notes/domain/models/note.dart';
import 'package:not_zero/units/notes/presentation/bloc/events/notes_list_event.dart';
import 'package:not_zero/units/notes/presentation/bloc/notes_list_bloc.dart';
import 'package:not_zero/units/notes/presentation/bloc/states/notes_list_state.dart';
import 'package:not_zero/units/notes/presentation/view/components/note_card.dart';

class NotesListScreen extends StatelessWidget {
  const NotesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ItemSelectionBloc>()),
        BlocProvider(
          create: (_) =>
              getIt<NotesListBloc>()..add(const NotesListEvent.loadNotes()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text(t.notes.list.title)),
        body: const _NotesListScreenBody(),
        floatingActionButton: const _NotesListFloatingButton(),
      ),
    );
  }
}

class _NotesListFloatingButton extends StatelessWidget {
  const _NotesListFloatingButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        GoRouter.of(context).push('/notes/new');
      },
      child: const Icon(Icons.note_add),
    );
  }
}

class _NotesListScreenBody extends StatelessWidget {
  const _NotesListScreenBody();

  @override
  Widget build(BuildContext context) {
    final listKey = GlobalKey();

    return BlocBuilder<NotesListBloc, NotesListState>(
      builder: (context, state) {
        return state.when(
          loading: () => const _NotesLoadingView(),
          loaded: (notes) => _NotesListView(notes, listKey: listKey),
        );
      },
    );
  }
}

class _NotesLoadingView extends StatelessWidget {
  const _NotesLoadingView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _NotesListView extends StatelessWidget {
  const _NotesListView(this.notes, {this.listKey});

  final List<Note> notes;
  final GlobalKey? listKey;

  @override
  Widget build(BuildContext context) {
    return UniversalListView<Note>(
      listKey: listKey,
      items: notes,
      itemBuilder: (_, item, __) => NoteCard(item),
    );
  }
}
