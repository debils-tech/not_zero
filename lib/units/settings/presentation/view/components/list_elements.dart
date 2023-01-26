import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SettingsBlocHeader extends StatelessWidget {
  const SettingsBlocHeader(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 9, top: 12, bottom: 6),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}

class SettingsMenuEntry extends StatelessWidget {
  const SettingsMenuEntry({
    required this.route,
    required this.title,
    this.icon,
    super.key,
  });

  final String route;
  final String title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => GoRouter.of(context).push(route),
      leading: icon != null ? Icon(icon) : null,
      title: Text(title),
    );
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
      onTap: () => launchUrlString(url, mode: LaunchMode.externalApplication),
      leading: icon != null ? Icon(icon) : null,
      title: Text(title),
    );
  }
}
