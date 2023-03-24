import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_zero/components/adaptive/list_limiter.dart';
import 'package:not_zero/components/common_widgets/date_range_switch.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/i18n/translations.g.dart';
import 'package:not_zero/units/stats/presentation/bloc/quick_statistics_cubit.dart';
import 'package:not_zero/units/stats/presentation/bloc/quick_statistics_state.dart';
import 'package:not_zero/units/stats/presentation/view/components/chart_card.dart';
import 'package:not_zero/units/stats/presentation/view/components/weekly_stats_chart.dart';

class QuickStatisticsScreen extends StatelessWidget {
  const QuickStatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<QuickStatisticsCubit>()..loadDays(),
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
                context.read<QuickStatisticsCubit>().loadDays(start, end),
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
          const _WeeklyChartWithSelection(),
        ],
      ),
    );
  }
}

class _WeeklyChartWithSelection extends StatelessWidget {
  const _WeeklyChartWithSelection();

  @override
  Widget build(BuildContext context) {
    final weeklyRendererKey = UniqueKey();

    return ChartCard(
      innerHeight: 220,
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: BlocBuilder<QuickStatisticsCubit, QuickStatisticsState>(
        builder: (context, state) {
          final stats = state.chartStats;
          if (stats == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: WeeklyStatsChart(
                  stats: stats,
                  rendererKey: weeklyRendererKey,
                  selectedIndex: state.selectedDayIndex,
                  start: state.chartRangeStart,
                  end: state.chartRangeEnd,
                ),
              ),
              const _SelectionGesture(),
            ],
          );
        },
      ),
    );
  }
}

class _SelectionGesture extends StatelessWidget {
  const _SelectionGesture();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuickStatisticsCubit>();
    return LayoutBuilder(
      builder: (context, constrains) {
        return SizedBox(
          width: constrains.maxWidth,
          height: constrains.maxHeight,
          child: Listener(
            onPointerDown: (event) =>
                _processTap(cubit, event.localPosition, constrains),
            onPointerMove: (event) =>
                _processTap(cubit, event.localPosition, constrains),
            behavior: HitTestBehavior.opaque,
          ),
        );
      },
    );
  }

  static void _processTap(
    QuickStatisticsCubit cubit,
    Offset eventPosition,
    BoxConstraints parentConstrains,
  ) {
    final eventX = eventPosition.dx;
    final fullWidth = parentConstrains.maxWidth;
    const sectorsCount = 7;
    final sectorWidth = fullWidth / sectorsCount;

    var index = eventX ~/ sectorWidth;
    if (index < 0) {
      index = 0;
    } else if (index > sectorsCount - 1) {
      index = sectorsCount - 1;
    }

    cubit.selectDay(index);
  }
}
