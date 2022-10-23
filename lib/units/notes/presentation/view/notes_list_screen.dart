import 'package:flutter/material.dart';
import 'package:not_zero/i18n/strings.g.dart';

class NotesListScreen extends StatelessWidget {
  const NotesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(t.notes.list.title)),
      // body: ,
    );
  }
}
