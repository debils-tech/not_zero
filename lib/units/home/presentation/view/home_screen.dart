import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/units/home/di.dart';
import 'package:not_zero/units/home/presentation/view/components/navigation_block.dart';
import 'package:not_zero/units/home/presentation/view/components/stats_header.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BlocProvider(
      create: (_) => ref.watch(homeScoreCubitProvider)..init(),
      child: const Scaffold(
        body: _HomeScreenBody(),
      ),
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  const _HomeScreenBody();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        HomeStatsHeader(),
        HomeNavigationBlock(),
      ],
    );
  }
}
