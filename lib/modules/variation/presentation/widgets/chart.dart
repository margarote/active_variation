import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/format_date.dart';
import '../../../../core/extensions/format_money.dart';
import '../../../../core/theme/colors_app.dart';
import '../../../../core/theme/text_theme_app.dart';
import '../../data/models/chart.dart';
import '../../data/models/indicators.dart';
import '../../domain/entities/calculated_variation_entity.dart';

class LineChartSample9 extends StatelessWidget {
  final Chart chart;
  final List<CalculatedVariationEntity> variationCalculeted;
  const LineChartSample9({
    super.key,
    required this.chart,
    required this.variationCalculeted,
  });

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final timestamp = chart.chart?.result?[0].timestamp?[value.toInt()] ?? 0;
    final item = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: true);
    const style = TextStyle(
      color: Colors.blueGrey,
      fontWeight: FontWeight.bold,
      fontSize: 9,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: Text(item.formatDate(), style: style),
    );
  }

  Widget rightTitleWidgets(double value, TitleMeta meta, BuildContext context) {
    final style = TextThemeApp.textTheme(
      TextStyleNum.headline0,
      context,
      headlineColor: ColorsApp.secoundaryTextColor,
      fontWeightNum: FontWeightNum.w700,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8,
      child: Text(double.parse(meta.formattedValue).formatMoney(), style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Indicators? indicators = chart.chart?.result?[0].indicators;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 30),
      child: SizedBox(
        height: 400,
        child: LineChart(
          LineChartData(
            lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
                maxContentWidth: 200,
                tooltipBgColor: ColorsApp.primary,
                tooltipRoundedRadius: 8,
                tooltipBorder: BorderSide(
                  color: ColorsApp.background,
                ),
                getTooltipItems: (touchedSpots) {
                  return touchedSpots.map((LineBarSpot touchedSpot) {
                    final textStyle = TextThemeApp.textTheme(
                      TextStyleNum.headline2,
                      context,
                      headlineColor: ColorsApp.textColorDark,
                      fontWeightNum: FontWeightNum.w700,
                    );
                    final data = variationCalculeted[touchedSpot.x.toInt()];
                    return LineTooltipItem(
                      'Dia: ${data.day}\nData: ${data.date}\nValor: ${data.value}\nVR (D-1): ${data.variationD1}\nVR (${data.primaryDate}): ${data.variationPrimaryDate}',
                      textStyle,
                      textAlign: TextAlign.left,
                    );
                  }).toList();
                },
              ),
              handleBuiltInTouches: true,
              getTouchLineStart: (data, index) => 0,
            ),
            lineBarsData: [
              LineChartBarData(
                color: Colors.black,
                spots: (indicators?.quote?[0].open ?? [])
                    .map((e) => FlSpot(indicators?.quote?[0].open?.indexOf(e).toDouble() ?? 0, e.toDouble()))
                    .toList(),
                isCurved: false,
                isStrokeCapRound: false,
                isStrokeJoinRound: false,
                isStepLineChart: false,
                barWidth: 1,
                belowBarData: BarAreaData(
                  show: false,
                ),
                dotData: FlDotData(
                  show: true,
                ),
              ),
            ],
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    return rightTitleWidgets(value, meta, context);
                  },
                  reservedSize: 45,
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: bottomTitleWidgets,
                  reservedSize: 25,
                ),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            gridData: FlGridData(
              show: true,
              drawHorizontalLine: true,
              drawVerticalLine: true,
              horizontalInterval: 1,
              verticalInterval: 1,
              checkToShowHorizontalLine: (value) {
                return value.toInt() == 0;
              },
              checkToShowVerticalLine: (value) {
                return value.toInt() == 0;
              },
            ),
            borderData: FlBorderData(show: false),
          ),
        ),
      ),
    );
  }
}
