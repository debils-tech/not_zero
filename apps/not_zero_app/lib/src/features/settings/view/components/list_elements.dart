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
import 'package:go_router/go_router.dart';
import 'package:not_zero_app/src/helpers/build_context_quick_access_ext.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SettingsBlocHeader extends StatelessWidget {
  const SettingsBlocHeader(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .only(left: 9, top: 12, bottom: 6),
      child: Text(
        text,
        style: context.theme.textTheme.titleSmall,
      ),
    );
  }
}

class SettingsMenuEntry extends StatelessWidget {
  const SettingsMenuEntry({
    required this.route,
    required this.title,
    this.icon,
    this.disabled = false,
    super.key,
  });

  final String route;
  final String title;
  final IconData? icon;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    final tile = ListTile(
      onTap: () => context.push(route),
      leading: icon != null ? Icon(icon) : null,
      title: Text(title),
    );

    if (disabled) {
      return IgnorePointer(
        child: Opacity(
          opacity: 0.3,
          child: tile,
        ),
      );
    }

    return tile;
  }
}

class SettingsUrlEntry extends StatelessWidget {
  const SettingsUrlEntry({
    required this.url,
    required this.title,
    this.icon,
    super.key,
  });

  final String url;
  final String title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => launchUrlString(url, mode: .externalApplication),
      leading: icon != null ? Icon(icon) : null,
      title: Text(title),
    );
  }
}
