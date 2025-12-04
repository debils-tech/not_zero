// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2025 Nagorny Vladislav
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero_app/src/features/habits/di.dart';
import 'package:not_zero_app/src/features/habits/view/components/habit_edit_fields.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class HabitEditScreen extends ConsumerWidget {
  const HabitEditScreen({this.habitToEdit, super.key});

  final Habit? habitToEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.watch(_formKeyProvider);

    final screenTitle = habitToEdit == null
        ? context.t.habits.edit.title.create
        : context.t.habits.edit.title.existing;
    final habitActions = habitToEdit != null
        ? [_DeleteHabitButton(habitToEdit!)]
        : null;

    final isChanged = ref.watch(_isHabitChangedProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(screenTitle),
        actions: habitActions,
      ),
      body: _HabitEditScreenBody(formKey, habitToEdit: habitToEdit),
      floatingActionButton: isChanged
          ? _FloatingSubmitButton(formKey, habitToEdit: habitToEdit)
          : null,
      floatingActionButtonLocation: .centerFloat,
    );
  }
}

class _DeleteHabitButton extends ConsumerWidget {
  const _DeleteHabitButton(this.habit);

  final Habit habit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () async {
        final navigator = GoRouter.of(context);
        final confirm = await showConfirmationDialog(
          context,
          title: context.t.common.dialog.deleteTitle,
          content: context.t.habits.edit.deleteDialog.content,
          confirm: context.t.common.dialog.deleteButton,
          dangerous: true,
        );
        if (confirm ?? false) {
          final notifier = ref.read(habitsListNotifierProvider.notifier);
          unawaited(notifier.deleteHabits({habit.id}));
          navigator.pop();
        }
      },
      iconSize: 26,
      tooltip: context.t.habits.edit.tooltips.deleteHabitButton,
      icon: Icon(
        Icons.delete_outline_rounded,
        color: context.theme.colorScheme.error,
      ),
    );
  }
}

class _HabitEditScreenBody extends ConsumerWidget {
  const _HabitEditScreenBody(this.formKey, {this.habitToEdit});

  final Habit? habitToEdit;
  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FormBuilder(
      key: formKey,
      initialValue: {
        HabitEditTitleField.name: habitToEdit?.title,
        HabitEditDescriptionField.name: habitToEdit?.description,
        HabitEditImportanceField.name:
            habitToEdit?.importance ?? TaskImportance.normal,
      },
      onChanged: () {
        final isValid = formKey.currentState?.validate() ?? false;
        ref.read(_isHabitChangedProvider.notifier).state = isValid;
      },
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;

        final router = GoRouter.of(context);
        final isChanged = ref.read(_isHabitChangedProvider);

        final canPop = await _canPop(isChanged, context);
        if (canPop) router.pop();
      },
      child: ListView(
        padding: const .only(
          left: 10,
          right: 10,
          top: 5,
          bottom: 70,
        ),
        children: const [
          HabitEditImportanceField(),
          SizedBox(height: 16),
          HabitEditTitleField(),
          SizedBox(height: 12),
          HabitEditDescriptionField(),
          SizedBox(height: 12),
        ],
      ),
    );
  }

  Future<bool> _canPop(bool isChanged, BuildContext context) async {
    if (!isChanged) return true;

    final confirm = await showConfirmationDialog(
      context,
      title: context.t.common.dialog.exitTitle,
      content: context.t.common.dialog.exitContent,
      dangerous: true,
    );
    if (confirm ?? false) return true;

    return false;
  }
}

class _FloatingSubmitButton extends ConsumerWidget {
  const _FloatingSubmitButton(this.formKey, {this.habitToEdit});

  final Habit? habitToEdit;
  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
      onPressed: () => _onTap(context, ref),
      style: FilledButton.styleFrom(
        elevation: 20,
        padding: const .symmetric(
          horizontal: 20,
          vertical: 15,
        ),
      ),
      child: Text(
        habitToEdit == null
            ? context.t.habits.edit.submit.create
            : context.t.habits.edit.submit.existing,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  void _onTap(BuildContext context, WidgetRef ref) {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      formKey.currentState!.save();
      final values = formKey.currentState!.value;

      final title = values[HabitEditTitleField.name] as String;
      final description = values[HabitEditDescriptionField.name] as String?;
      final importance =
          values[HabitEditImportanceField.name] as TaskImportance?;

      final prevHabit = habitToEdit;
      final notifier = ref.read(habitsListNotifierProvider.notifier);
      if (prevHabit == null) {
        unawaited(
          notifier.addHabit(
            Habit.create(
              title: title,
              description: description,
              importance: importance,
            ),
          ),
        );
      } else {
        unawaited(
          notifier.updateHabit(
            prevHabit.edit(
              title: title,
              description: description,
              importance: importance,
            ),
          ),
        );
      }

      context.pop();
    }
  }
}

final _formKeyProvider = Provider.autoDispose<GlobalKey<FormBuilderState>>((
  ref,
) {
  return GlobalKey<FormBuilderState>();
});

// TODO(uSlashVlad): Move `StateProvider` to `NotifierProvider`
// Maybe create some universal class for this.
final _isHabitChangedProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});
