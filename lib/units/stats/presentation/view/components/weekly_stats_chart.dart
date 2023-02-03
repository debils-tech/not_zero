import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeeklyStatsChart extends StatelessWidget {
  const WeeklyStatsChart();

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          horizontalInterval: 1,
          verticalInterval: 1,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.grey.shade800,
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: Colors.grey.shade800,
              strokeWidth: 1,
            );
          },
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d)),
        ),
        minX: -4,
        maxX: 8,
        minY: 0,
        maxY: 20,
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 0),
              FlSpot(1, 1),
              FlSpot(2, 4),
              FlSpot(3, 9),
              FlSpot(4, 16),
            ],
            isCurved: true,
            barWidth: 5,
            isStrokeCapRound: true,
          ),
        ],
      ),
    );
  }
}