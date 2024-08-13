import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_zero/units/settings/models/theme_state.dart';
import 'package:not_zero/units/settings/bloc/theme_bloc.dart';
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

class _ThemeSettingsOption extends StatelessWidget {
  const _ThemeSettingsOption({required this.name, required this.state});

  final String name;
  final ThemeState state;

  @override
  Widget build(BuildContext context) {
    final themeBloc = context.watch<AppThemeBloc>();

    return RadioListTile<ThemeState>(
      value: state,
      groupValue: themeBloc.state,
      title: Text(name),
      onChanged: (value) {
        if (value != themeBloc.state) themeBloc.add(value!);
      },
    );
  }
}
