import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HistoryLineChart extends StatelessWidget {
  const HistoryLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  const titles = ['Oct 24', 'Nov 24', 'Dec 24', 'Jan 25', 'Feb 25', 'Mar 25', 'Apr 25'];
                  if (value.toInt() >= 0 && value.toInt() < titles.length) {
                    return Text(titles[value.toInt()], style: TextStyle(color: Colors.white, fontSize: 10));
                  }
                  return Text('');
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 2),
                FlSpot(1, 4),
                FlSpot(2, 5),
                FlSpot(3, 3.8),
                FlSpot(4, 4),
                FlSpot(5, 4.2),
                FlSpot(6, 2),
              ],
              isCurved: true,
              color: Colors.greenAccent,
              barWidth: 2,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) =>
                    FlDotCirclePainter(radius: 4, color: Colors.black, strokeWidth: 2, strokeColor: Colors.greenAccent),
              ),
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
