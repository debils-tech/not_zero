import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/features/configs/models/common_configs/feature_toggles.dart';
import 'package:not_zero/features/configs/providers.dart';
import 'package:not_zero/features/router/router.dart';

class AppHomeBody extends ConsumerWidget {
  const AppHomeBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    final featureToggles = ref.watch(featureTogglesConfigProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('NotZero'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (featureToggles.features.contains(AppFeatures.planning))
            ListTile(
              leading: const Icon(Icons.note_alt_sharp),
              title: const Text('Plans'),
              onTap: () => router.push('/plans'),
            ),
          ListTile(
            leading: const Icon(Icons.settings_rounded),
            title: const Text('Settings'),
            onTap: () => router.push('/settings'),
          ),
        ],
      ),
    );
  }
}
