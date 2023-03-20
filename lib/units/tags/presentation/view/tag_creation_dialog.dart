import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero/components/confirmation_dialog.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/i18n/translations.g.dart';
import 'package:not_zero/units/tags/domain/models/tag.dart';
import 'package:not_zero/units/tags/domain/repositories/tags_repository.dart';

class TagCreationDialog extends StatelessWidget {
  const TagCreationDialog({super.key, this.tagToEdit});

  final ItemTag? tagToEdit;

  static Future<void> show(
    BuildContext context, [
    ItemTag? tagToEdit,
  ]) =>
      showModalBottomSheet(
        context: context,
        builder: (_) => TagCreationDialog(
          tagToEdit: tagToEdit,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

    final isEdit = tagToEdit != null;

    return Material(
      elevation: 1,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(28),
        topRight: Radius.circular(28),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: FormBuilder(
          key: formKey,
          initialValue: isEdit
              ? {
                  'name': tagToEdit!.name,
                  'color': tagToEdit!.color,
                }
              : {},
          child: Column(
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
                autofocus: true,
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
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 48,
                    child: isEdit ? _DeleteButton(tagToEdit!.id) : null,
                  ),
                  const SizedBox(width: 4),
                  Expanded(child: _SubmitButton(formKey, tagToEdit: tagToEdit)),
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

// TODO(uSlashVlad): Replace with normal color picker.
class _TagColorField extends StatelessWidget {
  const _TagColorField();

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<Color>(
      name: 'color',
      builder: (field) {
        return Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: field.value ?? Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
            ),
            Expanded(
              child: TextFormField(
                initialValue: _colorToText(field.value),
                onChanged: (value) => field.didChange(_textToColor(value)),
                decoration: InputDecoration(
                  labelText: t.tags.creation.fields.color,
                  hintText: '#FFFFFF',
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  String _colorToText(Color? color) {
    if (color == null) return '#ffffff';

    final hex = (color.value & 0xffffff).toRadixString(16);
    return '#$hex';
  }

  Color? _textToColor(String? value) {
    if (value == null) return null;
    if (value.length < 7 || !value.startsWith('#')) return null;

    final intRepresentation = int.tryParse('0xff${value.substring(1)}');
    if (intRepresentation == null) return null;

    return Color(intRepresentation);
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
          final color = values['color'] as Color?;

          final ItemTag tag;
          if (tagToEdit == null) {
            tag = ItemTag.create(name: name, color: color);
          } else {
            tag = tagToEdit!.edit(name: name, color: color);
          }

          getIt<TagsRepository>().addTag(tag);
          context.pop();
        }
      },
      style: const ButtonStyle(
        padding: MaterialStatePropertyAll(
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
