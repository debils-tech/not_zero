import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero/components/widgets/stars_rate.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/helpers/theming.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:not_zero/units/tasks/presentation/bloc/events/task_edit_event.dart';
import 'package:not_zero/units/tasks/presentation/bloc/task_edit_bloc.dart';

class TaskEditScreen extends StatelessWidget {
  const TaskEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

    return BlocProvider(
      create: (_) => getIt<TaskEditBloc>(),
      child: BlocBuilder<TaskEditBloc, bool>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('New task'),
            ),
            body: _TaskEditScreenBody(formKey),
            floatingActionButton: state ? _FloatingSubmitButton(formKey) : null,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        },
      ),
    );
  }
}

class _TaskEditScreenBody extends StatelessWidget {
  const _TaskEditScreenBody(this.formKey);

  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formKey,
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
              const _ImportanceField(),
              const SizedBox(height: 16),
              _TitleField(formKey),
              const SizedBox(height: 12),
              const _DescriptionField(),
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
      decoration: const InputDecoration(
        labelText: 'Task title',
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.minLength(1),
      ]),
      onChanged: (_) => context.read<TaskEditBloc>().add(
            TaskEditEvent.changeForm(
              correct: formKey.currentState?.validate() ?? false,
            ),
          ),
    );
  }
}

class _DescriptionField extends StatelessWidget {
  const _DescriptionField();

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: 'description',
      decoration: const InputDecoration(
        labelText: 'Description',
      ),
      maxLines: null,
    );
  }
}

class _ImportanceField extends StatelessWidget {
  const _ImportanceField();

  @override
  Widget build(BuildContext context) {
    final taskColors = Theme.of(context).extension<TaskColors>()!;

    return FormBuilderField<TaskImportance>(
      name: 'importance',
      initialValue: TaskImportance.normal,
      builder: (field) {
        return StarsRateWidget(
          count: 3,
          initialValue: 2,
          onChanged: (value) {
            field.didChange(TaskImportance.values[value]);
          },
          colorsByIndex: [
            taskColors.notImportantColor,
            taskColors.normalColor,
            taskColors.importantColor,
          ],
        );
      },
    );
  }
}

class _FloatingSubmitButton extends StatelessWidget {
  const _FloatingSubmitButton(this.formKey);

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
      child: const Text(
        'Create new task!',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
