import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero/components/confirmation_dialog.dart';
import 'package:not_zero/units/tasks/di.dart';
import 'package:not_zero/units/tasks/presentation/bloc/task_edit_cubit.dart';
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
    final formKey = GlobalKey<FormBuilderState>();

    final screenTitle = taskToEdit == null
        ? t.tasks.edit.title.create
        : t.tasks.edit.title.existing;
    final taskActions =
        taskToEdit != null ? [_DeleteTaskButton(taskToEdit!)] : null;

    return BlocProvider(
      create: (_) => ref.watch(taskEditCubitProvider),
      child: BlocBuilder<TaskEditCubit, bool>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(screenTitle),
              actions: taskActions,
            ),
            body: _TaskEditScreenBody(formKey, taskToEdit: taskToEdit),
            // Bloc builder for TaskEditCubit here exist for this only feature.
            floatingActionButton: state
                ? _FloatingSubmitButton(
                    formKey,
                    taskToEdit: taskToEdit,
                  )
                : null,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        },
      ),
    );
  }
}

class _DeleteTaskButton extends StatelessWidget {
  const _DeleteTaskButton(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final taskCubit = context.read<TaskEditCubit>();
        final navigator = GoRouter.of(context);
        final confirm = await showConfirmationDialog(
          context,
          title: t.common.dialog.deleteTitle,
          content: t.tasks.edit.deleteDialog.content,
          confirm: t.common.dialog.deleteButton,
          dangerous: true,
        );
        if (confirm ?? false) {
          unawaited(taskCubit.deleteTask(task));
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

class _TaskEditScreenBody extends StatelessWidget {
  const _TaskEditScreenBody(this.formKey, {this.taskToEdit});

  final Task? taskToEdit;
  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    final taskEditCubit = context.read<TaskEditCubit>();

    return FormBuilder(
      key: formKey,
      initialValue: {
        'title': taskToEdit?.title,
        'description': taskToEdit?.description,
        'importance': taskToEdit?.importance ?? TaskImportance.normal,
        'tags': taskToEdit?.tags,
      },
      onChanged: () => taskEditCubit.changeForm(
        isCorrect: formKey.currentState?.validate() ?? false,
      ),
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
              const SizedBox(height: 20),
              const TaskEditTagsSelectionField(),
              const SizedBox(height: 12),
              if (taskToEdit != null) TaskEditingInfo(taskToEdit!),
            ],
          ),
        ],
      ),
    );
  }
}

class _FloatingSubmitButton extends StatelessWidget {
  const _FloatingSubmitButton(this.formKey, {this.taskToEdit});

  final Task? taskToEdit;
  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final isValid = formKey.currentState!.validate();
        if (isValid) {
          formKey.currentState!.save();
          final values = formKey.currentState!.value;

          context.read<TaskEditCubit>().saveTask(
                title: values['title'] as String,
                importance: values['importance'] as TaskImportance,
                description: values['description'] as String?,
                tags: values['tags'] as List<ItemTag>?,
                taskToEdit: taskToEdit,
              );

          context.pop();
        }
      },
      style: const ButtonStyle(
        elevation: WidgetStatePropertyAll(20),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
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
}
