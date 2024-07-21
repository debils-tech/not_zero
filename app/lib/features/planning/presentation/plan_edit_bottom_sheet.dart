import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:not_zero/features/planning/models/daily_plan_model.dart';
import 'package:not_zero/features/planning/providers.dart';
import 'package:not_zero/features/router/router.dart';
import 'package:not_zero/utils/build_context_extensions.dart';

class PlanEditBottomSheet extends ConsumerWidget {
  const PlanEditBottomSheet({this.planToEdit, super.key});

  final DailyPlanModel? planToEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FormBuilder(
      key: ref.watch(_formBuilderKeyProvider),
      initialValue: {
        _TitleField.name: planToEdit?.title,
        _DescriptionField.name: planToEdit?.description,
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'New plan',
              style: context.textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            const _TitleField(),
            const SizedBox(height: 8),
            const _DescriptionField(),
            const SizedBox(height: 16),
            _AddButton(planToEdit),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _TitleField extends StatelessWidget {
  const _TitleField();

  static const name = 'plan_name';

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      validator: FormBuilderValidators.required(),
    );
  }
}

class _DescriptionField extends StatelessWidget {
  const _DescriptionField();

  static const name = 'plan_description';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FormBuilderTextField(
        name: name,
        expands: true,
        maxLines: null,
      ),
    );
  }
}

class _AddButton extends ConsumerWidget {
  const _AddButton(this.planToEdit);

  final DailyPlanModel? planToEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final key = ref.watch(_formBuilderKeyProvider);
    final plansListManager = ref.watch(plansListManagerProvider);
    final isLoading = ref.watch(_editLoadingStateProvider);
    final loadingNotifier = ref.watch(_editLoadingStateProvider.notifier);
    final router = ref.watch(routerProvider);

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return FilledButton.icon(
      onPressed: () async {
        final isValid = key.currentState?.saveAndValidate() ?? false;
        if (!isValid) return;

        final title = key.currentState?.value[_TitleField.name] as String;
        final description =
            key.currentState?.value[_DescriptionField.name] as String?;

        loadingNotifier.state = true;

        if (planToEdit == null) {
          final _ = await plansListManager.addPlan(
            title: title,
            description: description,
          );
          router.pop();
        } else {
          final _ = await plansListManager.editPlan(
            planToEdit!,
            title: title,
            description: description,
          );
          router.pop();
        }
      },
      icon: const Icon(Icons.add_rounded),
      label: const Text('Add'),
    );
  }
}

final _formBuilderKeyProvider =
    Provider.autoDispose<GlobalKey<FormBuilderState>>((ref) {
  return GlobalKey<FormBuilderState>();
});

final _editLoadingStateProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});
