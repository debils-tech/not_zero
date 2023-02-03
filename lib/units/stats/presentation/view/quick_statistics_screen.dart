import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_zero/components/adaptive/list_limiter.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/i18n/translations.g.dart';
import 'package:not_zero/units/stats/presentation/bloc/quick_statistics_cubit.dart';
import 'package:not_zero/units/stats/presentation/view/components/weekly_stats_chart.dart';

class QuickStatisticsScreen extends StatelessWidget {
  const QuickStatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<QuickStatisticsCubit>(),
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
    return AdaptiveListLimiter(
      maxWidth: 600,
      child: ListView(
        children: const [
          SizedBox(
            height: 150,
            child: WeeklyStatsChart(),
          ),
        ],
      ),
    );
  }
}
