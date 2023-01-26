import 'package:flutter/material.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/helpers/app_info.dart';
import 'package:not_zero/helpers/not_zero_icons.dart';

class LicensesScreen extends StatelessWidget {
  const LicensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appInfo = getIt<AppInfo>();
    return LicensePage(
      applicationName: appInfo.name,
      applicationIcon: const Padding(
        padding: EdgeInsets.only(top: 13, bottom: 8),
        child: Icon(NotZeroIcons.zero, size: 35),
      ),
      applicationLegalese: 'GNU GENERAL PUBLIC LICENSE version 3',
    );
  }
}
