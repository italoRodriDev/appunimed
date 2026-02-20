import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartLineAppComponent extends StatefulWidget {
  List<FlSpot> listData = [];

  ChartLineAppComponent({super.key, required this.listData});

  @override
  State<ChartLineAppComponent> createState() => _ChartLineAppComponentState();
}

class _ChartLineAppComponentState extends State<ChartLineAppComponent> {
  final Map<int, String> labels = {
    for (
      int i = 1;
      i <= DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day;
      i++
    )
      i: "Dia $i",
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: LineChart(
          LineChartData(
            minX: 1,
            maxX: 31,
            minY: 1,
            maxY: 5,
            gridData: FlGridData(show: true),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 60,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      'label',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 10,
                      ),
                    );
                  },
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 31,
                  getTitlesWidget: (value, meta) {
                    final int day = value.toInt();
                    return Text(
                      labels[day] ?? '',
                      style: const TextStyle(
                        color: AppColor.pantone382C,
                        fontSize: 8,
                      ),
                    );
                  },
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: Colors.white24),
            ),
            lineTouchData: LineTouchData(
              enabled: true,
              touchTooltipData: LineTouchTooltipData(
                getTooltipItems: (touchedSpots) {
                  return touchedSpots.map((LineBarSpot touchedSpot) {
                    final day = touchedSpot.x.toInt();
                    final value = 'label';

                    return LineTooltipItem(
                      "${labels[day] ?? 'Dia $day'}\nStatus: $value",
                      const TextStyle(color: Colors.white, fontSize: 12),
                    );
                  }).toList();
                },
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: widget.listData,
                isCurved: true,
                color: AppColor.pantone382C,
                barWidth: 1,
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: [
                      AppColor.pantone382C.withAlpha(60),
                      Colors.transparent,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ],
            extraLinesData: ExtraLinesData(
              horizontalLines: [
                HorizontalLine(
                  y: 3,
                  color: Colors.white,
                  strokeWidth: 1,
                  dashArray: [5, 5],
                  // linha tracejada
                  label: HorizontalLineLabel(
                    padding: EdgeInsetsGeometry.only(top: 10),
                    show: true,
                    alignment: Alignment.centerRight,
                    style: TextStyle(color: AppColor.pantone382C, fontSize: 8),
                    labelResolver: (_) => 'Ponto de equilibrio',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
