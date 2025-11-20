import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/stats/di.dart';
import 'package:not_zero_app/src/features/stats/notifiers/quick_statistics_notifier.dart';
import 'package:not_zero_app/src/features/stats/view/components/chart_card.dart';
import 'package:not_zero_app/src/features/stats/view/components/weekly_stats_chart.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class QuickStatisticsScreen extends ConsumerWidget {
  const QuickStatisticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: _QuickStatsAppBar(),
      body: _QuickStatsBody(),
    );
  }
}

class _QuickStatsAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _QuickStatsAppBar();

  @override
  Size get preferredSize => const .fromHeight(100);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quickStatsNotifier = ref.watch(
      quickStatisticsNotifierProvider.notifier,
    );
    return AppBar(
      title: Text(context.t.stats.quickView.title),
      bottom: PreferredSize(
        preferredSize: .zero,
        child: Padding(
          padding: const .all(4),
          child: DateRangeSwitch(
            rangeType: .week,
            onChanged: quickStatsNotifier.loadDays,
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
        padding: const .all(10),
        children: [
          Padding(
            padding: const .all(4),
            child: Text(
              context.t.stats.quickView.weeklyChart,
              style: context.theme.textTheme.bodyLarge,
            ),
          ),
          const SizedBox(height: 8),
          const _WeeklyChartWithSelection(),
        ],
      ),
    );
  }
}

class _WeeklyChartWithSelection extends ConsumerWidget {
  const _WeeklyChartWithSelection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weeklyRendererKey = UniqueKey();

    final state = ref.watch(quickStatisticsNotifierProvider);
    final chartStats = state.chartStats;

    if (chartStats == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return ChartCard(
      innerHeight: 220,
      padding: const .symmetric(vertical: 15),
      child: Stack(
        children: [
          Padding(
            padding: const .symmetric(horizontal: 25),
            child: WeeklyStatsChart(
              stats: chartStats,
              rendererKey: weeklyRendererKey,
              selectedIndex: state.selectedDayIndex,
              start: state.chartRangeStart,
              end: state.chartRangeEnd,
            ),
          ),
          const _SelectionGesture(),
        ],
      ),
    );
  }
}

class _SelectionGesture extends ConsumerWidget {
  const _SelectionGesture();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quickStatsNotifier = ref.watch(
      quickStatisticsNotifierProvider.notifier,
    );

    return LayoutBuilder(
      builder: (context, constrains) {
        return SizedBox(
          width: constrains.maxWidth,
          height: constrains.maxHeight,
          child: Listener(
            onPointerDown: (event) => _processTap(
              quickStatsNotifier,
              event.localPosition,
              constrains,
            ),
            onPointerMove: (event) => _processTap(
              quickStatsNotifier,
              event.localPosition,
              constrains,
            ),
            behavior: .opaque,
          ),
        );
      },
    );
  }

  static void _processTap(
    QuickStatisticsNotifier notifier,
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

    notifier.selectDay(index);
  }
}
