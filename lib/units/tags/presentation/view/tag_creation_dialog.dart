import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

class TagCreationDialog extends StatelessWidget {
  const TagCreationDialog({super.key});

  static Future<void> show(BuildContext context) => showModalBottomSheet(
        context: context,
        builder: (_) => const TagCreationDialog(),
      );

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

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
          child: Column(
            children: [
              Text(
                'New tag', // TODO(uSlashVlad): Replace with translation.
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
                maxLength: 30,
              ),
              const SizedBox(height: 8),
              const _TagColorField(),
              const Spacer(),
              _SubmitButton(formKey),
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
                decoration: const InputDecoration(
                  labelText: 'Color',
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

class _SubmitButton extends StatelessWidget {
  const _SubmitButton(this.formKey);

  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final isValid = formKey.currentState!.validate();
        if (isValid) {
          formKey.currentState!.save();
          final values = formKey.currentState!.value;

          print('Tag saved: ${values['name']}, ${values['color']}');
          context.pop();
        }
      },
      child: const Text(
        'Create new tag!', // TODO(uSlashVlad): Replace with translation.
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
