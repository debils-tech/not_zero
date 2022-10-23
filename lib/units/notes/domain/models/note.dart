import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:not_zero/helpers/object_id_mixin.dart';
import 'package:uuid/uuid.dart';

part 'note.freezed.dart';

@freezed
class Note with _$Note, ObjectIdMixin {
  factory Note({
    required String id,
    String? title,
    @Default('') String text,
    required DateTime createdAt,
    DateTime? modifiedAt,
  }) = _Note;

  const Note._();

  factory Note.create({
    String? title,
    required String text,
  }) =>
      Note(
        id: const Uuid().v4(),
        title: title,
        text: text,
        createdAt: DateTime.now(),
      );

  Note edit({String? title, String? text}) => copyWith(
        title: title,
        text: text ?? this.text,
      );

  List<String> get lines => text.split('\n');
}
