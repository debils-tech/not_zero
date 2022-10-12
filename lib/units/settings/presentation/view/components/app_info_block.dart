import 'package:flutter/material.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/helpers/app_info.dart';

class AppInfoBlock extends StatelessWidget {
  const AppInfoBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final appInfo = getIt<AppInfo>();
    final theme = Theme.of(context).textTheme.subtitle2 ?? const TextStyle();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${appInfo.name} (${appInfo.platform})',
            style: theme.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            'v${appInfo.version} (${appInfo.buildNumber})',
            style: theme.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
