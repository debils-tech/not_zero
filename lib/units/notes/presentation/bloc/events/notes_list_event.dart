import 'package:freezed_annotation/freezed_annotation.dart';

part 'notes_list_event.freezed.dart';

@freezed
class NotesListEvent with _$NotesListEvent {
  const factory NotesListEvent.loadNotes() = LoadNotesEvent;
}
