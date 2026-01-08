// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2025 Nagorny Vladislav
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:not_zero_app/src/features/common/view/components/common_widgets/reminder_picker_tile.dart';
import 'package:not_zero_app/src/features/common/view/components/common_widgets/stars_rate.dart';
import 'package:not_zero_app/src/features/themes/themes.dart';
import 'package:not_zero_app/src/features/translations/translations.g.dart';
import 'package:not_zero_app/src/helpers/build_context_quick_access_ext.dart';
import 'package:nz_base_models/nz_base_models.dart';

class HabitEditTitleField extends StatelessWidget {
  const HabitEditTitleField({super.key});

  static const name = 'title';

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      autofocus: true,
      textCapitalization: .sentences,
      decoration: InputDecoration(
        labelText: context.t.habits.edit.fields.habitTitle,
        counter: const SizedBox.shrink(),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
      textInputAction: .next,
      maxLength: 75,
    );
  }
}

class HabitEditDescriptionField extends StatelessWidget {
  const HabitEditDescriptionField({super.key});

  static const name = 'description';

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      textCapitalization: .sentences,
      decoration: InputDecoration(
        labelText: context.t.habits.edit.fields.habitDescription,
      ),
      textInputAction: .newline,
      maxLines: null,
    );
  }
}

class HabitEditImportanceField extends StatelessWidget {
  const HabitEditImportanceField({super.key});

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

class HabitEditReminderField extends StatelessWidget {
  const HabitEditReminderField({super.key});

  static const name = 'reminder_time';

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<ReminderLocalTime>(
      name: name,
      builder: (field) => ReminderPickerTile(
        value: field.value,
        onChanged: field.didChange,
        borderRadius: const BorderRadiusGeometry.all(Radius.circular(16)),
      ),
    );
  }
}
