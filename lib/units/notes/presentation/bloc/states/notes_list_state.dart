import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:not_zero/units/notes/domain/models/note.dart';

part 'notes_list_state.freezed.dart';

@freezed
abstract class NotesListState with _$NotesListState {
  const factory NotesListState.loading() = NotesLoadingState;

  const factory NotesListState.loaded(List<Note> notes) = NotesLoadedState;
}
