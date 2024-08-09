import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero/components/confirmation_dialog.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/i18n/translations.g.dart';
import 'package:not_zero/themes/tags_colors.dart';
import 'package:not_zero/units/tags/domain/models/tag.dart';
import 'package:not_zero/units/tags/domain/repositories/tags_repository.dart';

class TagCreationDialog extends StatefulWidget {
  const TagCreationDialog({super.key, this.tagToEdit});

  final ItemTag? tagToEdit;

  static Future<void> show(
    BuildContext context, [
    ItemTag? tagToEdit,
  ]) {
    return showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
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
    final isEdit = widget.tagToEdit != null;

    return Padding(
      padding: const EdgeInsets.all(8) + MediaQuery.of(context).viewInsets,
      child: FormBuilder(
        key: formKey,
        initialValue: isEdit
            ? {
                'name': widget.tagToEdit!.name,
                'color': widget.tagToEdit!.colorIndex,
              }
            : {
                'color': 0,
              },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isEdit
                  ? t.tags.creation.title.existing
                  : t.tags.creation.title.create,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            FormBuilderTextField(
              name: 'name',
              // autofocus: true,
              textCapitalization: TextCapitalization.words,
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 48,
                  child: isEdit ? _DeleteButton(widget.tagToEdit!.id) : null,
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: _SubmitButton(formKey, tagToEdit: widget.tagToEdit),
                ),
                const SizedBox(width: 48 + 4),
              ],
            ),
          ],
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
    final colors = theme.tagsColorScheme.allColors;

    const verticalPadding = 10.0;
    const iconSize = 34.0;
    const iconButtonPadding = 8.0;

    return FormBuilderField<int>(
      name: 'color',
      builder: (field) {
        return Container(
          height: 2 * (verticalPadding + iconButtonPadding) + iconSize,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: verticalPadding,
          ),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
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
                    shape: BoxShape.circle,
                  ),
                  child: const SizedBox.square(dimension: iconSize),
                ),
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox(width: 2);
            },
            itemCount: colors.length,
          ),
        );
      },
    );
  }
}

class _DeleteButton extends StatelessWidget {
  const _DeleteButton(this.tagId);

  final String tagId;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final navigator = GoRouter.of(context);
        final confirm = await showConfirmationDialog(
          context,
          title: t.common.dialog.deleteTitle,
          content: t.tags.creation.deleteDialog.content,
          confirm: t.common.dialog.deleteButton,
          dangerous: true,
        );
        if (confirm ?? false) {
          unawaited(getIt<TagsRepository>().deleteTag(tagId));
          navigator.pop();
        }
      },
      tooltip: t.tags.creation.tooltips.deleteTagButton,
      icon: Icon(
        Icons.delete_outline_rounded,
        color: Theme.of(context).colorScheme.error,
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton(this.formKey, {required this.tagToEdit});

  final GlobalKey<FormBuilderState> formKey;
  final ItemTag? tagToEdit;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final isValid = formKey.currentState!.validate();
        if (isValid) {
          formKey.currentState!.save();
          final values = formKey.currentState!.value;
          final name = values['name'] as String;
          final color = values['color'] as int;

          final ItemTag tag;
          if (tagToEdit == null) {
            tag = ItemTag.create(name: name, colorIndex: color);
          } else {
            tag = tagToEdit!.edit(name: name, colorIndex: color);
          }

          getIt<TagsRepository>().addTag(tag);
          context.pop();
        }
      },
      style: const ButtonStyle(
        elevation: WidgetStatePropertyAll(20),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: 16),
        ),
      ),
      child: Text(
        t.tags.creation.submit,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
