import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/features/home/providers.dart';
import 'package:not_zero/features/router/router.dart';
import 'package:not_zero/features/settings/presentation/widget/settings_items.dart';
import 'package:not_zero/utils/build_context_extensions.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: const [
          _SettingsUserDataBlock(),
        ],
      ),
    );
  }
}

class _SettingsUserDataBlock extends ConsumerWidget {
  const _SettingsUserDataBlock();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authManager = ref.watch(authManagerProvider);
    final router = ref.watch(routerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SettingsHeaderItem(text: 'User data'),
        SettingsTileItem(
          onTap: () async {
            final success = await authManager.logOut();
            if (!success) return;

            ref.invalidate(initProgressProvider);
            router.go('/');
          },
          title: 'Logout',
          icon: Icon(Icons.logout_rounded, color: context.colors.error),
          danger: true,
        ),
      ],
    );
  }
}
