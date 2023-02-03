import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:not_zero/themes/charts_colors.dart';

class WeeklyStatsChart extends StatelessWidget {
  const WeeklyStatsChart(
    this.weeklyStats, {
    super.key,
    required this.rendererKey,
  });

  final Key rendererKey;
  final List<int> weeklyStats;

  @override
  Widget build(BuildContext context) {
    final chartsColors = Theme.of(context).chartsColorScheme;

    final maxHeight = weeklyStats.fold<int>(
          0,
          (element, previousValue) {
            if (element > previousValue) {
              return element;
            }
            return previousValue;
          },
        ) +
        8.0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: maxHeight,
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(
                weeklyStats.length,
                (index) {
                  return FlSpot(
                    index.toDouble(),
                    weeklyStats[index].toDouble(),
                  );
                },
              ),
              isCurved: true,
              curveSmoothness: 0.3,
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
                getTitlesWidget: (value, _) {
                  final weekDay = DateTime.now()
                      .subtract(
                        Duration(days: 6 - value.round()),
                      )
                      .weekday;
                  final String title;
                  switch (weekDay) {
                    case 1:
                      title = 'Mon';
                      break;
                    case 2:
                      title = 'Tue';
                      break;
                    case 3:
                      title = 'Web';
                      break;
                    case 4:
                      title = 'Thu';
                      break;
                    case 5:
                      title = 'Fri';
                      break;
                    case 6:
                      title = 'Sat';
                      break;
                    case 7:
                      title = 'Sun';
                      break;
                    default:
                      title = '';
                  }

                  return Text(title);
                },
              ),
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
      ),
    );
  }
}
