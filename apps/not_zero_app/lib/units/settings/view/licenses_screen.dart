import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/helpers/not_zero_icons.dart';
import 'package:not_zero_app/units/settings/di.dart';

class LicensesScreen extends ConsumerWidget {
  const LicensesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appInfo = ref.watch(appInfoProvider);
    return LicensePage(
      applicationName: switch (appInfo) {
        AsyncData(value: final info) => info.name,
        _ => '...',
      },
      applicationIcon: const Padding(
        padding: EdgeInsets.only(top: 13, bottom: 8),
        child: Icon(NotZeroIcons.zero, size: 35),
      ),
      applicationLegalese: 'GNU GENERAL PUBLIC LICENSE version 3',
    );
  }
}
