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
import 'package:not_zero_app/src/features/tags/di.dart';
import 'package:not_zero_app/src/features/tasks/di.dart';
import 'package:not_zero_app/src/features/tasks/view/components/task_edit_fields.dart';
import 'package:not_zero_app/src/features/tasks/view/components/task_editing_info.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class TaskEditScreen extends ConsumerWidget {
  const TaskEditScreen({this.taskToEdit, super.key});

  final Task? taskToEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.watch(_formKeyProvider);

    final screenTitle = taskToEdit == null
        ? context.t.tasks.edit.title.create
        : context.t.tasks.edit.title.existing;
    final taskActions = taskToEdit != null
        ? [_DeleteTaskButton(taskToEdit!)]
        : null;

    final isChanged = ref.watch(_isTaskChangedProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(screenTitle),
        actions: taskActions,
      ),
      body: _TaskEditScreenBody(formKey, taskToEdit: taskToEdit),
      // Bloc builder for TaskEditCubit here exist for this only feature.
      floatingActionButton: isChanged
          ? _FloatingSubmitButton(formKey, taskToEdit: taskToEdit)
          : null,
      floatingActionButtonLocation: .centerFloat,
    );
  }
}

class _DeleteTaskButton extends ConsumerWidget {
  const _DeleteTaskButton(this.task);

  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () async {
        final navigator = GoRouter.of(context);
        final confirm = await showConfirmationDialog(
          context,
          title: context.t.common.dialog.deleteTitle,
          content: context.t.tasks.edit.deleteDialog.content,
          confirm: t.common.dialog.deleteButton,
          dangerous: true,
        );
        if (confirm ?? false) {
          final notifier = ref.read(tasksMainListNotifier.notifier);
          unawaited(notifier.deleteTasks({task.id}));
          navigator.pop();
        }
      },
      iconSize: 26,
      tooltip: context.t.tasks.edit.tooltips.deleteTaskButton,
      icon: Icon(
        Icons.delete_outline_rounded,
        color: context.theme.colorScheme.error,
      ),
    );
  }
}

class _TaskEditScreenBody extends ConsumerWidget {
  const _TaskEditScreenBody(this.formKey, {this.taskToEdit});

  final Task? taskToEdit;
  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.read(tasksFiltersNotifier);
    final tags = ref.read(tagsListNotifierProvider).value;
    final selectedTags = tags
        ?.where((e) => filters.searchTags.contains(e.id))
        .toList();

    return FormBuilder(
      key: formKey,
      initialValue: {
        TaskEditTitleField.name: taskToEdit?.title,
        TaskEditDescriptionField.name: taskToEdit?.description,
        TaskEditImportanceField.name:
            taskToEdit?.importance ?? TaskImportance.normal,
        TaskEditTagsSelectionField.name: taskToEdit?.tags ?? selectedTags,
        TaskEditForDateField.name: taskToEdit?.forDate ?? filters.forDate,
        TaskEditPersistenceField.name: taskToEdit?.persistent ?? true,
      },
      onChanged: () {
        final isValid = formKey.currentState?.validate() ?? false;
        ref.read(_isTaskChangedProvider.notifier).state = isValid;
      },
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;

        final router = GoRouter.of(context);
        final isChanged = ref.read(_isTaskChangedProvider);

        final canPop = await _canPop(isChanged, context);
        if (canPop) router.pop();
      },
      child: Stack(
        children: [
          ListView(
            padding: const .only(
              left: 10,
              right: 10,
              top: 5,
              bottom: 70,
            ),
            children: [
              const TaskEditImportanceField(),
              const SizedBox(height: 16),
              const TaskEditTitleField(),
              const SizedBox(height: 12),
              const TaskEditDescriptionField(),
              const SizedBox(height: 12),
              const TaskEditForDateField(),
              const SizedBox(height: 8),
              const TaskEditPersistenceField(),
              // const SizedBox(height: 6),
              const Divider(height: 24),
              // const SizedBox(height: 20),
              const TaskEditTagsSelectionField(),
              if (taskToEdit != null) ...[
                const SizedBox(height: 6),
                const Divider(height: 24),
                TaskEditingInfo(taskToEdit!),
              ],
            ],
          ),
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
  const _FloatingSubmitButton(this.formKey, {this.taskToEdit});

  final Task? taskToEdit;
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
        taskToEdit == null
            ? context.t.tasks.edit.submit.create
            : context.t.tasks.edit.submit.existing,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  void _onTap(BuildContext context, WidgetRef ref) {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      formKey.currentState!.save();
      final values = formKey.currentState!.value;

      final title = values[TaskEditTitleField.name] as String;
      final importance = values[TaskEditImportanceField.name] as TaskImportance;
      final description = values[TaskEditDescriptionField.name] as String?;
      final tags = values[TaskEditTagsSelectionField.name] as List<ItemTag>?;
      final forDate = values[TaskEditForDateField.name] as DateTime?;
      final persistent = values[TaskEditPersistenceField.name] as bool;

      final prevTask = taskToEdit;
      final notifier = ref.read(tasksMainListNotifier.notifier);
      if (prevTask == null) {
        unawaited(
          notifier.addTask(
            Task.create(
              title: title,
              importance: importance,
              description: description,
              tags: tags,
              forDate: forDate,
              persistent: persistent,
            ),
          ),
        );
      } else {
        unawaited(
          notifier.updateTask(
            prevTask.edit(
              title: title,
              importance: importance,
              description: description,
              tags: tags,
              forDate: forDate,
              persistent: persistent,
            ),
          ),
        );
      }

      // TODO(uSlashVlad): Remove navigation using context
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
final _isTaskChangedProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});
