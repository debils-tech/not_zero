import 'package:not_zero/units/notes/domain/models/note.dart';

abstract class NotesRepository {
  Stream<List<Note>> getNotes();

  Future<void> addNote(Note note);

  Future<void> updateNote(Note note);
}
