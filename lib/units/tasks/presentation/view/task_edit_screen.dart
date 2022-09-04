import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero/components/widgets/stars_rate.dart';
import 'package:not_zero/get_it.dart';
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
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(20),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
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
