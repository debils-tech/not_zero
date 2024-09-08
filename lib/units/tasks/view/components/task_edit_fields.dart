import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:not_zero/components/common_widgets/fancy_date_picker_button.dart';
import 'package:not_zero/components/common_widgets/stars_rate.dart';
import 'package:not_zero/units/tags/view/tag_selector.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';
import 'package:nz_tags_models/nz_tags_models.dart';
import 'package:nz_tasks_models/nz_tasks_models.dart';

class TaskEditTitleField extends StatelessWidget {
  const TaskEditTitleField({super.key});

  static const name = 'title';

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: t.tasks.edit.fields.taskTitle,
        counter: const SizedBox.shrink(),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
      maxLength: 75,
    );
  }
}

class TaskEditDescriptionField extends StatelessWidget {
  const TaskEditDescriptionField({super.key});

  static const name = 'description';

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
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

  static const name = 'importance';

  @override
  Widget build(BuildContext context) {
    final taskColors = Theme.of(context).tasksColorScheme;

    return FormBuilderField<TaskImportance>(
      name: name,
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

class TaskEditTagsSelectionField extends StatelessWidget {
  const TaskEditTagsSelectionField({super.key});

  static const name = 'tags';

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<List<ItemTag>>(
      name: name,
      builder: (field) {
        return ItemTagSelector(
          selectedTags: (field.value ?? []).map((e) => e.id).toSet(),
          onSelection: (tag, isSelected) {
            final newValue = field.value?.toSet() ?? {};
            if (isSelected) {
              newValue.add(tag);
            } else {
              newValue.remove(tag);
            }
            field.didChange(newValue.toList());
          },
        );
      },
    );
  }
}

class TaskEditForDateField extends StatelessWidget {
  const TaskEditForDateField({super.key});

  static const name = 'for_date';

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<DateTime>(
      name: name,
      builder: (field) {
        return FancyDatePickerButton(
          value: field.value ?? DateTime.now(),
          onChanged: field.didChange,
        );
      },
    );
  }
}
