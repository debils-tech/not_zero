import 'package:freezed_annotation/freezed_annotation.dart';

part 'notes_list_event.freezed.dart';

@freezed
abstract class NotesListEvent with _$NotesListEvent {
  const factory NotesListEvent.loadNotes() = LoadNotesEvent;

  const factory NotesListEvent.deleteSelected(Set<String> notes) =
      DeleteSelectedNotesEvent;
}
