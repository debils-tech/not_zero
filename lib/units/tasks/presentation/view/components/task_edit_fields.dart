import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:not_zero/components/common_widgets/stars_rate.dart';
import 'package:not_zero/i18n/translations.g.dart';
import 'package:not_zero/themes/task_colors.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';

class TaskEditTitleField extends StatelessWidget {
  const TaskEditTitleField({super.key});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: 'title',
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: t.tasks.edit.fields.taskTitle,
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
      maxLength: 50,
    );
  }
}

class TaskEditDescriptionField extends StatelessWidget {
  const TaskEditDescriptionField({super.key});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: 'description',
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: t.tasks.edit.fields.taskDescription,
      ),
      maxLines: null,
    );
  }
}

class TaskEditImportanceField extends StatelessWidget {
  const TaskEditImportanceField({super.key});

  @override
  Widget build(BuildContext context) {
    final taskColors = Theme.of(context).tasksColorScheme;

    return FormBuilderField<TaskImportance>(
      name: 'importance',
      builder: (field) {
        return StarsRateWidget(
          count: 3,
          initialValue: field.value?.index ?? 2,
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
    );
  }
}
