import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/features/configs/models/common_configs/feature_toggles.dart';
import 'package:not_zero/features/configs/providers.dart';
import 'package:not_zero/features/router/router.dart';
import 'package:not_zero/features/supabase/providers.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initProgress = ref.watch(_initProgressProvider);

    return switch (initProgress) {
      AsyncData(:final value) => value ? const _HomeBody() : const _ErrorBody(),
      _ => const _LoadingBody(),
    };
  }
}

class _LoadingBody extends StatelessWidget {
  const _LoadingBody();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Loading...')));
  }
}

class _ErrorBody extends StatelessWidget {
  const _ErrorBody();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Error on initialization')));
  }
}

class _HomeBody extends ConsumerWidget {
  const _HomeBody();

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
        ],
      ),
    );
  }
}

final _initProgressProvider = FutureProvider<bool>((ref) async {
  final supabaseManager = ref.watch(supabaseManagerProvider);

  await supabaseManager.init();

  final success =
      await supabaseManager.login('u.slash.vlad@gmail.com', '123456');
  if (!success) return false;

  final configsManager = ref.watch(configsManagerProvider);
  await configsManager.init();

  return true;
});
