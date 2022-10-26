import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:not_zero/components/common_widgets/stars_rate.dart';
import 'package:not_zero/helpers/theming.dart';
import 'package:not_zero/i18n/strings.g.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:not_zero/units/tasks/presentation/bloc/task_edit_cubit.dart';

class TaskEditTitleField extends StatelessWidget {
  const TaskEditTitleField(this.formKey, {super.key});

  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: 'title',
      autofocus: true,
      decoration: InputDecoration(
        labelText: t.tasks.edit.fields.taskTitle,
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
      maxLength: 50,
      onChanged: (_) => context.read<TaskEditCubit>().changeForm(
            isCorrect: formKey.currentState?.validate() ?? false,
          ),
    );
  }
}

class TaskEditDescriptionField extends StatelessWidget {
  const TaskEditDescriptionField(this.formKey, {super.key});

  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: 'description',
      decoration: InputDecoration(
        labelText: t.tasks.edit.fields.taskDescription,
      ),
      maxLines: null,
      onChanged: (_) => context.read<TaskEditCubit>().changeForm(
            isCorrect: formKey.currentState?.validate() ?? false,
          ),
    );
  }
}

class TaskEditImportanceField extends StatelessWidget {
  const TaskEditImportanceField(this.formKey, {super.key});

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
      onChanged: (_) => context.read<TaskEditCubit>().changeForm(
            isCorrect: formKey.currentState?.validate() ?? false,
          ),
    );
  }
}
