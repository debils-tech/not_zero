import 'package:injectable/injectable.dart';
import 'package:not_zero/units/notes/domain/models/note.dart';
import 'package:not_zero/units/notes/domain/repositories/notes_repository.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: NotesRepository)
class NotesRepositoryImpl implements NotesRepository {
  final _notesStreamController = BehaviorSubject<List<Note>>.seeded([]);

  @override
  Stream<List<Note>> getNotes() => _notesStreamController.asBroadcastStream();

  @override
  Future<void> addNote(Note note) async {
    _notesStreamController.add([note, ..._notesStreamController.value]);
    // TODO(uSlashVlad): Save note to local database.
  }

  @override
  Future<void> updateNote(Note note) async {
    final currentList = _notesStreamController.value;
    final indexOfSavedNote = currentList.indexWhere((e) => e.id == note.id);

    if (indexOfSavedNote != -1) {
      final newList = [...currentList];
      newList[indexOfSavedNote] = note;

      // TODO(uSlashVlad): Here needs to be some sort of sorting.
      // Last modified tasks should go first.
    }

    // TODO(uSlashVlad): Save note to local database.
  }
}
