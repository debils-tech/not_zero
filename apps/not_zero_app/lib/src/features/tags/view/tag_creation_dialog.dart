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

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero_app/src/features/common/view/components/confirmation_dialog.dart';
import 'package:not_zero_app/src/features/tags/di.dart';
import 'package:not_zero_app/src/features/themes/extensions/tags_colors.dart';
import 'package:not_zero_app/src/features/translations/translations.g.dart';
import 'package:not_zero_app/src/helpers/build_context_quick_access_ext.dart';
import 'package:nz_base_models/nz_base_models.dart';

class TagCreationDialog extends StatefulWidget {
  const TagCreationDialog({super.key, this.tagToEdit});

  final ItemTag? tagToEdit;

  static Future<void> show(
    BuildContext context, [
    ItemTag? tagToEdit,
  ]) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: .only(
          topLeft: .circular(28),
          topRight: .circular(28),
        ),
      ),
      builder: (_) => TagCreationDialog(
        tagToEdit: tagToEdit,
      ),
    );
  }

  @override
  State<TagCreationDialog> createState() => _TagCreationDialogState();
}

class _TagCreationDialogState extends State<TagCreationDialog> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final tagToEdit = widget.tagToEdit;
    final isEdit = tagToEdit != null;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8) + MediaQuery.viewInsetsOf(context),
        child: FormBuilder(
          key: formKey,
          initialValue: isEdit
              ? {
                  'name': tagToEdit.name,
                  'color': tagToEdit.colorIndex,
                }
              : {
                  'color': 0,
                },
          child: Column(
            mainAxisSize: .min,
            children: [
              Text(
                isEdit
                    ? context.t.tags.creation.title.existing
                    : context.t.tags.creation.title.create,
                style: context.theme.textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              FormBuilderTextField(
                name: 'name',
                // autofocus: true,
                textCapitalization: .words,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                decoration: InputDecoration(
                  labelText: t.tags.creation.fields.name,
                ),
                maxLength: 30,
              ),
              const SizedBox(height: 8),
              const _TagColorField(),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: .spaceEvenly,
                children: [
                  SizedBox(
                    width: 48,
                    child: isEdit ? _DeleteButton(tagToEdit.id) : null,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: _SubmitButton(formKey, tagToEdit: tagToEdit),
                  ),
                  const SizedBox(width: 48 + 4),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TagColorField extends StatelessWidget {
  const _TagColorField();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.tagsColorScheme.allColors();

    const verticalPadding = 10.0;
    const iconSize = 34.0;
    const iconButtonPadding = 8.0;

    return FormBuilderField<int>(
      name: 'color',
      builder: (field) {
        return Container(
          height: 2 * (verticalPadding + iconButtonPadding) + iconSize,
          padding: const .symmetric(
            horizontal: 16,
            vertical: verticalPadding,
          ),
          child: ListView.separated(
            scrollDirection: .horizontal,
            itemBuilder: (_, index) {
              final isSelected = field.value == index;
              return IconButton(
                onPressed: () => field.didChange(index),
                icon: DecoratedBox(
                  decoration: BoxDecoration(
                    color: colors[index],
                    border: isSelected
                        ? Border.all(
                            color: theme.colorScheme.onSurface,
                            width: 3,
                            strokeAlign: BorderSide.strokeAlignCenter,
                          )
                        : null,
                    shape: .circle,
                  ),
                  child: const SizedBox.square(dimension: iconSize),
                ),
              );
            },
            separatorBuilder: (_, _) {
              return const SizedBox(width: 2);
            },
            itemCount: colors.length,
          ),
        );
      },
    );
  }
}

class _DeleteButton extends ConsumerWidget {
  const _DeleteButton(this.tagId);

  final String tagId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () async {
        final navigator = GoRouter.of(context);
        final confirm = await showConfirmationDialog(
          context,
          title: context.t.common.dialog.deleteTitle,
          content: context.t.tags.creation.deleteDialog.content,
          confirm: context.t.common.dialog.deleteButton,
          dangerous: true,
        );
        if (confirm ?? false) {
          unawaited(
            ref.read(tagsListNotifierProvider.notifier).deleteTag(tagId),
          );
          navigator.pop();
        }
      },
      tooltip: context.t.tags.creation.tooltips.deleteTagButton,
      icon: Icon(
        Icons.delete_outline_rounded,
        color: context.theme.colorScheme.error,
      ),
    );
  }
}

class _SubmitButton extends ConsumerWidget {
  const _SubmitButton(this.formKey, {required this.tagToEdit});

  final GlobalKey<FormBuilderState> formKey;
  final ItemTag? tagToEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
      onPressed: () {
        final isValid = formKey.currentState!.validate();
        if (isValid) {
          formKey.currentState!.save();
          final values = formKey.currentState!.value;
          final name = values['name'] as String;
          final color = values['color'] as int;

          final ItemTag tag;
          if (tagToEdit == null) {
            tag = .create(name: name, colorIndex: color);
          } else {
            tag = tagToEdit!.edit(name: name, colorIndex: color);
          }

          unawaited(ref.read(tagsListNotifierProvider.notifier).addTag(tag));
          context.pop();
        }
      },
      style: FilledButton.styleFrom(
        padding: const .symmetric(vertical: 16),
      ),
      child: Text(
        context.t.tags.creation.submit,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
