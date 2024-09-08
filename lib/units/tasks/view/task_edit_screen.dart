import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero/components/confirmation_dialog.dart';
import 'package:not_zero/units/tasks/di.dart';
import 'package:not_zero/units/tasks/view/components/task_edit_fields.dart';
import 'package:not_zero/units/tasks/view/components/task_editing_info.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';
import 'package:nz_tags_models/nz_tags_models.dart';
import 'package:nz_tasks_models/nz_tasks_models.dart';

class TaskEditScreen extends ConsumerWidget {
  const TaskEditScreen({this.taskToEdit, super.key});

  final Task? taskToEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.watch(_formKeyProvider);

    final screenTitle = taskToEdit == null
        ? t.tasks.edit.title.create
        : t.tasks.edit.title.existing;
    final taskActions =
        taskToEdit != null ? [_DeleteTaskButton(taskToEdit!)] : null;

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
          title: t.common.dialog.deleteTitle,
          content: t.tasks.edit.deleteDialog.content,
          confirm: t.common.dialog.deleteButton,
          dangerous: true,
        );
        if (confirm ?? false) {
          final repository = ref.read(tasksRepositoryProvider);
          unawaited(repository.deleteTask(task.id));
          navigator.pop();
        }
      },
      iconSize: 26,
      tooltip: t.tasks.edit.tooltips.deleteTaskButton,
      icon: Icon(
        Icons.delete_outline_rounded,
        color: Theme.of(context).colorScheme.error,
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

    return FormBuilder(
      key: formKey,
      initialValue: {
        TaskEditTitleField.name: taskToEdit?.title,
        TaskEditDescriptionField.name: taskToEdit?.description,
        TaskEditImportanceField.name:
            taskToEdit?.importance ?? TaskImportance.normal,
        TaskEditTagsSelectionField.name: taskToEdit?.tags,
        TaskEditForDateField.name: taskToEdit?.forDate ?? filters.forDate,
        TaskEditPersistenceField.name: taskToEdit?.persistent ?? true,
      },
      onChanged: () {
        final isValid = formKey.currentState?.validate() ?? false;
        ref.read(_isTaskChangedProvider.notifier).state = isValid;
      },
      // TODO(uSlashVlad): Implement proper check with dialog
      canPop: true,
      // onWillPop: () async {
      //   if (!taskEditCubit.isChanged) {
      //     return true;
      //   }

      //   final confirm = await showConfirmationDialog(
      //     context,
      //     title: t.common.dialog.exitTitle,
      //     content: t.common.dialog.exitContent,
      //     dangerous: true,
      //   );
      //   if (confirm ?? false) {
      //     return true;
      //   }

      //   return false;
      // },
      child: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.only(
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
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
      ),
      child: Text(
        taskToEdit == null
            ? t.tasks.edit.submit.create
            : t.tasks.edit.submit.existing,
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
      final forDate = values[TaskEditForDateField.name] as DateTime;
      final persistent = values[TaskEditPersistenceField.name] as bool;

      final prevTask = taskToEdit;
      final repository = ref.read(tasksRepositoryProvider);
      if (prevTask == null) {
        repository.addTask(
          Task.create(
            title: title,
            importance: importance,
            description: description,
            tags: tags,
            forDate: forDate,
            persistent: persistent,
          ),
        );
      } else {
        repository.updateTask(
          prevTask.edit(
            title: title,
            importance: importance,
            description: description,
            tags: tags,
            forDate: forDate,
            persistent: persistent,
          ),
        );
      }

      // TODO(uSlashVlad): Remove navigation using context
      context.pop();
    }
  }
}

final _formKeyProvider =
    StateProvider.autoDispose<GlobalKey<FormBuilderState>>((ref) {
  return GlobalKey<FormBuilderState>();
});

final _isTaskChangedProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});
