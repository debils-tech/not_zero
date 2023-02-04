import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_zero/components/adaptive/list_limiter.dart';
import 'package:not_zero/components/common_widgets/date_range_switch.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/i18n/translations.g.dart';
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
      child: const Scaffold(
        appBar: _QuickStatsAppBar(),
        body: _QuickStatsBody(),
      ),
    );
  }
}

class _QuickStatsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _QuickStatsAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(t.stats.quickView.title),
      bottom: PreferredSize(
        preferredSize: Size.zero,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: DateRangeSwitch(
            onChanged: (start, end) =>
                context.read<QuickStatisticsCubit>().loadStats(start, end),
          ),
        ),
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
          Padding(
            padding: const EdgeInsets.all(4),
            child: Text(
              t.stats.quickView.weeklyChart,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const SizedBox(height: 8),
          ChartCard(
            innerHeight: 200,
            child: BlocBuilder<QuickStatisticsCubit, QuickStatisticsState>(
              builder: (context, state) {
                final stats = state.chartStats;
                if (stats == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                return WeeklyStatsChart(
                  stats,
                  rendererKey: weeklyRendererKey,
                  start: state.chartRangeStart,
                  end: state.chartRangeEnd,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
