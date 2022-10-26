import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/units/notes/domain/models/note.dart';
import 'package:not_zero/units/notes/domain/repositories/notes_repository.dart';
import 'package:not_zero/units/notes/presentation/bloc/events/notes_list_event.dart';
import 'package:not_zero/units/notes/presentation/bloc/states/notes_list_state.dart';

@injectable
class NotesListBloc extends Bloc<NotesListEvent, NotesListState> {
  NotesListBloc(this._repository) : super(const NotesListState.loading()) {
    on<LoadNotesEvent>((event, emit) => _onLoadNotes);
  }

  final NotesRepository _repository;

  Future<void> _onLoadNotes(
    LoadNotesEvent event,
    Emitter<NotesListState> emit,
  ) async {
    // TODO(uSlashVlad): Add sync.

    await emit.forEach<List<Note>>(
      _repository.getNotes(),
      onData: NotesListState.loaded,
    );
  }

  Future<void> _onDeleteSelectedNotes(
    DeleteSelectedNotesEvent event,
    Emitter<NotesListState> _,
  ) {
    // TODO(uSlashVlad): Implement it.
    throw UnimplementedError();
  }
}
