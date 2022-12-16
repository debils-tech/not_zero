import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:not_zero/i18n/strings.g.dart';
import 'package:not_zero/units/notes/domain/models/note.dart';

class NoteEditScreen extends StatelessWidget {
  const NoteEditScreen({this.noteToEdit, super.key});

  final Note? noteToEdit;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

    final screenTitle = noteToEdit == null
        ? t.notes.edit.title.create
        : t.notes.edit.title.existing;

    return Scaffold(
      appBar: AppBar(
        title: Text(screenTitle),
      ),
      body: _NoteEditScreenBody(
        formKey,
        noteToEdit: noteToEdit,
      ),
    );
  }
}

class _NoteEditScreenBody extends StatelessWidget {
  const _NoteEditScreenBody(this.formKey, {this.noteToEdit});

  final GlobalKey<FormBuilderState> formKey;

  final Note? noteToEdit;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
