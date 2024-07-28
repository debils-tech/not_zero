import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/features/home/presentation/app_home_body.dart';
import 'package:not_zero/features/home/presentation/app_login_body.dart';
import 'package:not_zero/features/home/providers.dart';
import 'package:not_zero/utils/build_context_extensions.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initProgress = ref.watch(initProgressProvider);

    return switch (initProgress) {
      AsyncData(:final value) =>
        value ? const AppHomeBody() : const AppLoginBody(),
      AsyncError(error: final e, stackTrace: final s) => _ErrorBody(e, s),
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
  const _ErrorBody(this.error, this.stack);

  final Object? error;
  final StackTrace? stack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Error on initialization: $error\n\n$stack',
          style: context.textTheme.bodyMedium
              ?.copyWith(color: context.colors.error),
        ),
      ),
    );
  }
}
