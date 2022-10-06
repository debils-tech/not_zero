import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/units/home/presentation/bloc/home_score_cubit.dart';
import 'package:not_zero/units/home/presentation/view/components/navigation_block.dart';
import 'package:not_zero/units/home/presentation/view/components/stats_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeScoreCubit>(),
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
