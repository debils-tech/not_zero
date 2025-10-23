import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class HabitsListFloatingButtons extends StatelessWidget {
  const HabitsListFloatingButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context.push('/habits/new'),
      tooltip: t.habits.list.tooltips.addNewButton,
      child: const Icon(Icons.add_rounded),
    );
  }
}
