import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsBlocHeader extends StatelessWidget {
  const SettingsBlocHeader(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 9, top: 12, bottom: 6),
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}

class SettingsMenuEntry extends StatelessWidget {
  const SettingsMenuEntry({
    required this.route,
    required this.title,
    required this.icon,
    super.key,
  });

  final String route;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => GoRouter.of(context).push(route),
      leading: Icon(icon),
      title: Text(title),
    );
  }
}
