import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nz_base_models/nz_base_models.dart';

class HabitEditScreen extends ConsumerWidget {
  const HabitEditScreen({this.habitToEdit, super.key});

  final Habit? habitToEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenTitle = habitToEdit == null ? 'Create Habit' : 'Edit Habit';

    return Scaffold(
      appBar: AppBar(
        title: Text(screenTitle),
      ),
      body: const Center(
        child: Text('Habit Edit Screen Template'),
      ),
    );
  }
}
