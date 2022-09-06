import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:not_zero/components/widgets/stars_rate.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/helpers/confirmation_dialog.dart';
import 'package:not_zero/helpers/theming.dart';
import 'package:not_zero/i18n/strings.g.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:not_zero/units/tasks/presentation/bloc/events/task_edit_event.dart';
import 'package:not_zero/units/tasks/presentation/bloc/task_edit_bloc.dart';

class TaskEditScreen extends StatelessWidget {
  const TaskEditScreen({this.taskToEdit, super.key});

  final Task? taskToEdit;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

    return BlocProvider(
      create: (_) => getIt<TaskEditBloc>(),
      child: BlocBuilder<TaskEditBloc, bool>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                taskToEdit == null
                    ? t.tasks.edit.title.create
                    : t.tasks.edit.title.existing,
              ),
              actions: taskToEdit != null
                  ? [
                      _DeleteTaskButton(taskToEdit!),
                    ]
                  : null,
            ),
            body: _TaskEditScreenBody(formKey, taskToEdit: taskToEdit),
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
        title: t.tasks.edit.deleteDialog.title,
        content: t.tasks.edit.deleteDialog.content,
        confirm: t.tasks.edit.deleteDialog.confrm,
        dangerous: true,
      ).then((value) {
        if (value == true) {
          context.read<TaskEditBloc>().add(DeleteTaskEvent(task: task));
          GoRouter.of(context).pop();
        }
      }),
      iconSize: 26,
      tooltip: 'Delete',
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
              _ImportanceField(formKey),
              const SizedBox(height: 16),
              _TitleField(formKey),
              const SizedBox(height: 12),
              _DescriptionField(formKey),
              const SizedBox(height: 8),
              if (taskToEdit != null) _EditingTaskInfo(taskToEdit!),
            ],
          ),
        ],
      ),
    );
  }
}

class _TitleField extends StatelessWidget {
  const _TitleField(this.formKey);

  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: 'title',
      decoration: InputDecoration(
        labelText: t.tasks.edit.fields.taskTitle,
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
      maxLength: 50,
      onChanged: (_) => context.read<TaskEditBloc>().add(
            TaskEditEvent.changeForm(
              correct: formKey.currentState?.validate() ?? false,
            ),
          ),
    );
  }
}

class _DescriptionField extends StatelessWidget {
  const _DescriptionField(this.formKey);

  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: 'description',
      decoration: InputDecoration(
        labelText: t.tasks.edit.fields.taskDescription,
      ),
      maxLines: null,
      onChanged: (_) => context.read<TaskEditBloc>().add(
            TaskEditEvent.changeForm(
              correct: formKey.currentState?.validate() ?? false,
            ),
          ),
    );
  }
}

class _ImportanceField extends StatelessWidget {
  const _ImportanceField(this.formKey);

  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    final taskColors = Theme.of(context).extension<TaskColors>()!;

    return FormBuilderField<TaskImportance>(
      name: 'importance',
      builder: (field) {
        return StarsRateWidget(
          count: 3,
          initialValue: field.value?.toIndex() ?? 2,
          onChanged: (value) {
            field.didChange(TaskImportance.fromIndex(value));
          },
          colorsByIndex: [
            taskColors.notImportantColor,
            taskColors.normalColor,
            taskColors.importantColor,
          ],
        );
      },
      onChanged: (_) => context.read<TaskEditBloc>().add(
            TaskEditEvent.changeForm(
              correct: formKey.currentState?.validate() ?? false,
            ),
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

        context.read<TaskEditBloc>().add(
              TaskEditEvent.saveTask(
                title: values['title'] as String,
                description: values['description'] as String?,
                importance: values['importance'] as TaskImportance,
                taskToEdit: taskToEdit,
              ),
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

    final timeFormat = DateFormat.Hms();
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
          t.tasks.list.timeSubtitle.createdAt(time: createAtDate),
          style: textTheme,
        ),
        const SizedBox(height: 2),
        if (modifiedAtDate != null)
          Text(
            t.tasks.list.timeSubtitle.modifiedAt(time: modifiedAtDate),
            style: textTheme,
          ),
      ],
    );
  }
}
