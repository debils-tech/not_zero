import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:not_zero/helpers/date_transformations.dart';
import 'package:not_zero/i18n/translations.g.dart';
import 'package:not_zero/themes/charts_colors.dart';

class WeeklyStatsChart extends StatelessWidget {
  WeeklyStatsChart(
    this.stats, {
    super.key,
    required this.rendererKey,
    DateTime? start,
    DateTime? end,
  })  : rangeStart = start ?? DateTime.now().startOfWeek,
        rangeEnd = end ?? DateTime.now().endOfWeek;

  final Key rendererKey;
  final List<int> stats;
  final DateTime rangeStart;
  final DateTime rangeEnd;

  @override
  Widget build(BuildContext context) {
    final chartsColors = Theme.of(context).chartsColorScheme;

    return LineChart(
      LineChartData(
        minX: 0,
        maxX: daysCount.toDouble(),
        minY: 0,
        maxY: maxHeight,
        lineBarsData: [
          LineChartBarData(
            spots: _getChartSpots(),
            isCurved: false,
            // curveSmoothness: 0.3,
            barWidth: 5,
            isStrokeCapRound: true,
            color: chartsColors.weeklyStatsLine,
            belowBarData: BarAreaData(
              show: true,
              gradient: chartsColors.weeklyStatsBelowGradient,
            ),
          ),
        ],
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: _getBottomTitleWidget,
            ),
          ),
        ),
        lineTouchData: LineTouchData(
          enabled: true,
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: chartsColors.tooltipBackgroundColor,
          ),
        ),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
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
    final weekDay = start.add(Duration(days: value.round())).weekday;
    final title = _getShortNameOfWeekDay(weekDay);
    return Text(title);
  }

  static String _getShortNameOfWeekDay(int weekDay) {
    switch (weekDay) {
      case 1:
        return t.common.weekDays.short.monday;
      case 2:
        return t.common.weekDays.short.tuesday;
      case 3:
        return t.common.weekDays.short.wednesday;
      case 4:
        return t.common.weekDays.short.thursday;
      case 5:
        return t.common.weekDays.short.friday;
      case 6:
        return t.common.weekDays.short.saturday;
      case 7:
        return t.common.weekDays.short.sunday;
      default:
        return '';
    }
  }
}
