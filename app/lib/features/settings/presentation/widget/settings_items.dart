import 'package:flutter/material.dart';
import 'package:not_zero/utils/build_context_extensions.dart';

class SettingsHeaderItem extends StatelessWidget {
  const SettingsHeaderItem({
    required this.text,
    this.danger = false,
    super.key,
  });

  final String text;
  final bool danger;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8, left: 16, right: 16),
      child: Text(
        text,
        style: context.textTheme.titleMedium
            ?.copyWith(color: danger ? context.colors.error : null),
      ),
    );
  }
}

class SettingsTileItem extends StatelessWidget {
  const SettingsTileItem({
    required this.onTap,
    required this.title,
    this.subtitle,
    this.icon,
    this.danger = false,
    super.key,
  });

  final String title;
  final String? subtitle;
  final Widget? icon;
  final VoidCallback? onTap;
  final bool danger;

  @override
  Widget build(BuildContext context) {
    final titleText =
        danger ? _recollorText(title, context.colors.error) : Text(title);
    final subtitle = this.subtitle;
    final subtitleText = subtitle != null
        ? danger
            ? _recollorText(subtitle, context.colors.error)
            : Text(subtitle)
        : null;

    return ListTile(
      onTap: onTap,
      leading: icon,
      title: titleText,
      subtitle: subtitleText,
    );
  }

  Widget _recollorText(String text, Color color) {
    return Builder(
      builder: (context) {
        final defaultStyle = DefaultTextStyle.of(context);
        return Text(
          text,
          style: defaultStyle.style.copyWith(color: color),
        );
      },
    );
  }
}
