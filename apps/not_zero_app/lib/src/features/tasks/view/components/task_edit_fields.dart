import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:not_zero_app/src/features/tags/view/tag_selector.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

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
        labelText: context.t.tasks.edit.fields.taskTitle,
        counter: const SizedBox.shrink(),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
      textInputAction: TextInputAction.next,
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
        labelText: context.t.tasks.edit.fields.taskDescription,
      ),
      textInputAction: TextInputAction.next,
      maxLines: null,
    );
  }
}

class TaskEditImportanceField extends StatelessWidget {
  const TaskEditImportanceField({super.key});

  static const name = 'importance';

  @override
  Widget build(BuildContext context) {
    final taskColors = context.theme.tasksColorScheme;

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
        return Row(
          children: [
            Expanded(
              child: FancyDatePickerButton(
                value: field.value,
                onChanged: field.didChange,
              ),
            ),
            if (field.value != null) ...[
              const SizedBox(width: 8),
              OutlinedButton.icon(
                onPressed: () => field.didChange(null),
                icon: const Icon(Icons.close_rounded),
                label: Text(context.t.tasks.edit.fields.taskForSomeday),
              ),
            ],
          ],
        );
      },
    );
  }
}

class TaskEditPersistenceField extends StatelessWidget {
  const TaskEditPersistenceField({super.key});

  static const name = 'persistent';

  @override
  Widget build(BuildContext context) {
    return FormBuilderSwitch(
      name: name,
      decoration: const InputDecoration(border: InputBorder.none),
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(
        context.t.tasks.edit.fields.taskPersistence,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}
