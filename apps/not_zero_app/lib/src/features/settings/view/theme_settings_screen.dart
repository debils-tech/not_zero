import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/settings/di.dart';
import 'package:not_zero_app/src/features/settings/models/theme_state.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class ThemeSettingsScreen extends ConsumerWidget {
  const ThemeSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSettings = ref.watch(themeSettingsNotifierProvider);
    final themeStateController = ref.watch(
      themeSettingsNotifierProvider.notifier,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.settings.theme.title),
      ),
      body: RadioGroup<ThemeState>(
        groupValue: themeSettings.themeState,
        onChanged: (value) {
          if (value != null && value != themeSettings.themeState) {
            themeStateController.setTheme(value);
          }
        },
        child: ListView(
          children: [
            RadioListTile<ThemeState>(
              title: Text(context.t.settings.theme.values.light),
              value: ThemeState.light,
            ),
            RadioListTile<ThemeState>(
              title: Text(context.t.settings.theme.values.dark),
              value: ThemeState.dark,
            ),
            RadioListTile<ThemeState>(
              title: Text(context.t.settings.theme.values.system),
              value: ThemeState.system,
            ),
            const Divider(),
            _DynamicColorsCheckbox(
              enabled: themeSettings.useDynamicColors,
              onChanged: themeStateController.setUseDynamicColors,
            ),
            SwitchListTile(
              value: themeSettings.harmonizeColors,
              onChanged: themeStateController.setHarmonizeColors,
              title: Text(context.t.settings.theme.harmonizeColors.title),
              subtitle: Text(context.t.settings.theme.harmonizeColors.subtitle),
            ),
          ],
        ),
      ),
    );
  }
}

class _DynamicColorsCheckbox extends StatelessWidget {
  const _DynamicColorsCheckbox({
    required this.enabled,
    required this.onChanged,
  });

  final bool enabled;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    final isSupported =
        Platform.isAndroid ||
        Platform.isLinux ||
        Platform.isMacOS ||
        Platform.isWindows;

    return SwitchListTile(
      value: enabled,
      onChanged: isSupported ? onChanged : null,
      title: Text(context.t.settings.theme.useDynamicColorsOption.title),
      subtitle: Text(
        isSupported
            ? context.t.settings.theme.useDynamicColorsOption.subtitle
            : context
                  .t
                  .settings
                  .theme
                  .useDynamicColorsOption
                  .subttileUnavailable,
      ),
    );
  }
}
