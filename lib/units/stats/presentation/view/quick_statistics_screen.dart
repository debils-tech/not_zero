import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_zero/components/adaptive/list_limiter.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/i18n/translations.g.dart';
import 'package:not_zero/themes/charts_colors.dart';
import 'package:not_zero/units/stats/presentation/bloc/quick_statistics_cubit.dart';
import 'package:not_zero/units/stats/presentation/bloc/states/quick_statistics_state.dart';
import 'package:not_zero/units/stats/presentation/view/components/chart_card.dart';
import 'package:not_zero/units/stats/presentation/view/components/weekly_stats_chart.dart';

class QuickStatisticsScreen extends StatelessWidget {
  const QuickStatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<QuickStatisticsCubit>()..loadStats(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(t.stats.quickView.title),
        ),
        body: const _QuickStatsBody(),
      ),
    );
  }
}

class _QuickStatsBody extends StatelessWidget {
  const _QuickStatsBody();

  @override
  Widget build(BuildContext context) {
    final weeklyRendererKey = UniqueKey();
    return AdaptiveListLimiter(
      maxWidth: 600,
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          ChartCard(
            innerHeight: 200,
            child: BlocBuilder<QuickStatisticsCubit, QuickStatisticsState>(
              builder: (context, state) {
                final stats = state.weeklyStats;
                if (stats == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                return WeeklyStatsChart(
                  stats,
                  rendererKey: weeklyRendererKey,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
