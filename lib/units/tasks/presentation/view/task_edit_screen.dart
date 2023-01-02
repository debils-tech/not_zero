import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:not_zero/components/confirmation_dialog.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/i18n/translations.g.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:not_zero/units/tasks/presentation/bloc/task_edit_cubit.dart';
import 'package:not_zero/units/tasks/presentation/view/components/task_edit_fields.dart';

class TaskEditScreen extends StatelessWidget {
  const TaskEditScreen({this.taskToEdit, super.key});

  final Task? taskToEdit;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

    final screenTitle = taskToEdit == null
        ? t.tasks.edit.title.create
        : t.tasks.edit.title.existing;
    final taskActions =
        taskToEdit != null ? [_DeleteTaskButton(taskToEdit!)] : null;

    return BlocProvider(
      create: (_) => getIt<TaskEditCubit>(),
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
      onPressed: () => showConfirmationDialog(
        context,
        title: t.common.dialog.deleteTitle,
        content: t.tasks.edit.deleteDialog.content,
        confirm: t.common.dialog.deleteButton,
        dangerous: true,
      ).then((value) {
        if (value ?? false) {
          context.read<TaskEditCubit>().deleteTask(task);
          GoRouter.of(context).pop();
        }
      }),
      iconSize: 26,
      tooltip: t.tasks.edit.tooltips.deleteTaskButton,
      icon: Icon(
        Icons.delete_outline,
        color: Theme.of(context).errorColor,
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
    return FormBuilder(
      key: formKey,
      initialValue: {
        'title': taskToEdit?.title,
        'description': taskToEdit?.description,
        'importance': taskToEdit?.importance ?? TaskImportance.normal,
      },
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
              TaskEditImportanceField(formKey),
              const SizedBox(height: 16),
              TaskEditTitleField(formKey),
              const SizedBox(height: 12),
              TaskEditDescriptionField(formKey),
              const SizedBox(height: 8),
              if (taskToEdit != null) _EditingTaskInfo(taskToEdit!),
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
        formKey.currentState!.save();
        final values = formKey.currentState!.value;

        context.read<TaskEditCubit>().saveTask(
              title: values['title'] as String,
              description: values['description'] as String?,
              importance: values['importance'] as TaskImportance,
              taskToEdit: taskToEdit,
            );

        GoRouter.of(context).pop();
      },
      style: const ButtonStyle(
        elevation: MaterialStatePropertyAll(20),
        padding: MaterialStatePropertyAll(
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

class _EditingTaskInfo extends StatelessWidget {
  const _EditingTaskInfo(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.subtitle2;

    final timeFormat = DateFormat.Hm();
    final dateFormat = DateFormat.yMMMMd();
    final createAtDate = '${timeFormat.format(task.createdAt)}'
        ' '
        '${dateFormat.format(task.createdAt)}';
    final modifiedAtDate = task.modifiedAt != null
        ? '${timeFormat.format(task.modifiedAt!)}'
            ' '
            '${dateFormat.format(task.modifiedAt!)}'
        : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.common.timeSubtitle.createdAt(time: createAtDate),
          style: textTheme,
        ),
        const SizedBox(height: 2),
        if (modifiedAtDate != null)
          Text(
            t.common.timeSubtitle.modifiedAt(time: modifiedAtDate),
            style: textTheme,
          ),
      ],
    );
  }
}
