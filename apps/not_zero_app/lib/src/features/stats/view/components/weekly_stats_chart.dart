import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nz_common/nz_common.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class WeeklyStatsChart extends StatelessWidget {
  WeeklyStatsChart({
    required this.stats,
    required this.rendererKey,
    this.selectedIndex,
    DateTime? start,
    DateTime? end,
    super.key,
  }) : rangeStart = start ?? DateTime.now().startOfWeek,
       rangeEnd = end ?? DateTime.now().endOfWeek;

  final List<int> stats;
  final int? selectedIndex;
  final Key rendererKey;

  final DateTime rangeStart;
  final DateTime rangeEnd;

  @override
  Widget build(BuildContext context) {
    final chartsColors = context.theme.chartsColorScheme;

    final barData = LineChartBarData(
      spots: _getChartSpots(),
      // curveSmoothness: 0.3,
      barWidth: 5,
      isStrokeCapRound: true,
      color: chartsColors.weeklyStatsLine,
      belowBarData: BarAreaData(
        show: true,
        gradient: chartsColors.weeklyStatsBelowGradient,
      ),
      showingIndicators: selectedIndex != null ? [selectedIndex!] : [],
    );

    return LineChart(
      LineChartData(
        minX: 0,
        maxX: daysCount.toDouble(),
        minY: 0,
        maxY: maxHeight,
        lineBarsData: [barData],
        titlesData: FlTitlesData(
          topTitles: const AxisTitles(),
          leftTitles: const AxisTitles(),
          rightTitles: const AxisTitles(),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              reservedSize: 30,
              getTitlesWidget: _getBottomTitleWidget,
            ),
          ),
        ),
        showingTooltipIndicators: selectedIndex != null
            ? [
                ShowingTooltipIndicators(
                  [
                    LineBarSpot(barData, 0, barData.spots[selectedIndex!]),
                  ],
                ),
              ]
            : [],
        lineTouchData: LineTouchData(
          enabled: false,
          // },
          touchTooltipData: LineTouchTooltipData(
            getTooltipColor: (_) => chartsColors.tooltipBackgroundColor,
            tooltipBorderRadius: const BorderRadius.all(Radius.circular(8)),
            getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
              return lineBarsSpot.map((lineBarSpot) {
                return LineTooltipItem(
                  lineBarSpot.y.toInt().toString(),
                  TextStyle(
                    color: context.theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }).toList();
            },
          ),
        ),
        gridData: FlGridData(
          drawHorizontalLine: false,
          verticalInterval: 1,
          getDrawingVerticalLine: (_) {
            return FlLine(
              color: chartsColors.gridColor,
              strokeWidth: 1,
            );
          },
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.fromBorderSide(
            BorderSide(color: chartsColors.borderColor),
          ),
        ),
      ),
      chartRendererKey: rendererKey,
    );
  }

  double get maxHeight =>
      stats.fold<int>(
        0,
        (element, previousValue) {
          if (element > previousValue) {
            return element;
          }
          return previousValue;
        },
      ) +
      8.0;

  int get daysCount => rangeEnd.difference(rangeStart).inDays;

  List<FlSpot> _getChartSpots() {
    return List.generate(
      stats.length,
      (index) {
        return FlSpot(
          index.toDouble(),
          stats[index].toDouble(),
        );
      },
    );
  }

  // It is normal to return widgets since it is builder function for chart.
  // ignore: avoid-returning-widgets
  Widget _getBottomTitleWidget(double value, TitleMeta _) {
    final start = rangeStart;
    final specificDay = start.add(Duration(days: value.round()));
    final title = DateFormat.E().format(specificDay);
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(title),
    );
  }
}
