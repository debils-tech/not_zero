import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/settings/di.dart';
import 'package:not_zero_app/src/features/settings/models/theme_state.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class ThemeSettingsScreen extends StatelessWidget {
  const ThemeSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.settings.theme.title),
      ),
      body: ListView(
        children: [
          _ThemeSettingsOption(
            name: t.settings.theme.values.light,
            state: ThemeState.light,
          ),
          _ThemeSettingsOption(
            name: t.settings.theme.values.dark,
            state: ThemeState.dark,
          ),
          _ThemeSettingsOption(
            name: t.settings.theme.values.system,
            state: ThemeState.system,
          ),
        ],
      ),
    );
  }
}

class _ThemeSettingsOption extends ConsumerWidget {
  const _ThemeSettingsOption({required this.name, required this.state});

  final String name;
  final ThemeState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeStateNotifierProvider);
    final themeStateController = ref.watch(themeStateNotifierProvider.notifier);

    return RadioListTile<ThemeState>(
      value: state,
      groupValue: themeState,
      title: Text(name),
      onChanged: (value) {
        if (value != null && value != themeState) {
          themeStateController.setTheme(value);
        }
      },
    );
  }
}
