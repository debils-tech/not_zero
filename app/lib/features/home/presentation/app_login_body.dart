import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:not_zero/features/env/providers.dart';
import 'package:not_zero/features/home/providers.dart';
import 'package:not_zero/utils/build_context_extensions.dart';

class AppLoginBody extends ConsumerWidget {
  const AppLoginBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: FormBuilder(
        key: ref.watch(_formKeyProvider),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not Zero',
                    style: context.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  const _EmailField(),
                  const SizedBox(height: 8),
                  const _PasswordField(),
                  const SizedBox(height: 16),
                  const _SubmitButtons(),
                  const SizedBox(height: 16),
                  const _DevModeBlock(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  static const name = 'email';

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.email(),
      ]),
      keyboardType: TextInputType.emailAddress,
      enableSuggestions: true,
      decoration: const InputDecoration(
        labelText: 'Email',
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();

  static const name = 'password';

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      obscureText: true,
      validator: FormBuilderValidators.minLength(4),
      decoration: const InputDecoration(
        labelText: 'Password',
      ),
    );
  }
}

class _SubmitButtons extends ConsumerWidget {
  const _SubmitButtons();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.watch(_formKeyProvider);
    final authManager = ref.watch(authManagerProvider);

    Future<void> login() async {
      final (email, password) = _saveAndValidate(formKey);
      if (email == null || password == null) return;

      final success = await authManager.loginByPassword(
        email: email,
        password: password,
      );
      if (!success) return;

      ref.invalidate(initProgressProvider);
    }

    Future<void> signUp() async {
      final (email, password) = _saveAndValidate(formKey);
      if (email == null || password == null) return;

      final success = await authManager.signUpByPassword(
        email: email,
        password: password,
      );
      if (!success) return;

      ref.invalidate(initProgressProvider);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FilledButton.icon(
            onPressed: login,
            icon: const Icon(Icons.login_rounded),
            label: const Text('Login'),
          ),
          const SizedBox(height: 8),
          FilledButton.tonalIcon(
            onPressed: signUp,
            icon: const Icon(Icons.person_add_rounded),
            label: const Text('Sign up'),
          ),
        ],
      ),
    );
  }

  (String? email, String? password) _saveAndValidate(
    GlobalKey<FormBuilderState> key,
  ) {
    final state = key.currentState;
    if (state == null) return (null, null);

    final valid = state.saveAndValidate();
    if (!valid) return (null, null);

    final email = state.value[_EmailField.name];
    final password = state.value[_PasswordField.name];

    return (email, password);
  }
}

class _DevModeBlock extends ConsumerWidget {
  const _DevModeBlock();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final devMode = ref.watch(devModeProvider);
    if (!devMode) return const SizedBox();

    final devEnvironment = ref.watch(useDevFlagStateProvider);
    final envManager = ref.watch(envManagerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Divider(),
        const SizedBox(height: 8),
        const SizedBox(height: 8),
        const Text('Environment:'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('production'),
            const SizedBox(width: 4),
            Switch(
              value: devEnvironment,
              onChanged: (value) {
                print('val: $value');
                if (value) {
                  envManager.switchToDev();
                } else {
                  envManager.switchToProduction();
                }
              },
            ),
            const SizedBox(width: 4),
            const Text('development'),
          ],
        ),
      ],
    );
  }
}

final _formKeyProvider = Provider<GlobalKey<FormBuilderState>>((ref) {
  return GlobalKey<FormBuilderState>();
});
