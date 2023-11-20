import 'dart:math';

import 'package:dolaraldia_argentina/utils/us_to_ve.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  const Chart({
    super.key,
    required this.prices,
    required this.dates,
    required this.hours,
    required this.isCrypto,
  });

  // X coords
  double get maxPrice => (prices).reduce(max);
  double get minPrice => (prices).reduce(min);

  // Y coords
  double get maxBound => ((maxPrice * 10).truncate() / 10) + 0.2;
  double get minBound {
    final temp = ((minPrice * 10).truncate() / 10) - 0.2;

    return temp < 0 ? 0.0 : temp;
  }

  final bool isCrypto;

  // Data arrays
  final List<double> prices;
  final List<dynamic> dates;
  final List<dynamic> hours;

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 12.0,
    );

    final intValue = value.truncate();

    if (intValue.isOdd || intValue == prices.length - 1) {
      return Container();
    }

    final date = dates[intValue];
    final splitDate = date.split('-');
    final formattedDate = '${splitDate[2]}/${splitDate[1]}';

    final textW = FittedBox(
      child: Text(
        formattedDate,
        style: style,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: textW,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 12.0,
    );

    if (value == minBound || value == maxBound) {
      return Container();
    }

    final Widget box;

    if (!isCrypto) {
      final temp = (value * 10).truncate();
      final text = (temp / 10).toString();

      box = FittedBox(
        child: Text(
          text,
          style: style,
          textAlign: TextAlign.center,
        ),
      );
    } else {
      final temp = value;
      final f = NumberFormat('#,##0.0', 'es_VE');
      final text = '${f.format(temp)}k';

      box = FittedBox(
        child: Text(
          text,
          style: style,
          textAlign: TextAlign.center,
        ),
      );
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4.0,
      child: box,
    );
  }

  @override
  Widget build(BuildContext context) {
    const lineTooltipItemTextStyle = TextStyle(color: Colors.white);

    final lineTouchData = LineTouchData(
        getTouchedSpotIndicator: (barData, spotIndexes) {
          const indicatorBelowLine = FlLine(
            color: Colors.blueAccent,
            strokeWidth: 2,
          );

          final touchedSpotDotData = FlDotData(
            getDotPainter: (p0, p1, p2, p3) {
              return FlDotCirclePainter(
                radius: 5,
                color: Colors.blueAccent.withOpacity(0.5),
                strokeWidth: 1,
                strokeColor: Colors.blueAccent,
              );
            },
          );

          return spotIndexes
              .map(
                (spotIndex) => TouchedSpotIndicatorData(
                  indicatorBelowLine,
                  touchedSpotDotData,
                ),
              )
              .toList();
        },
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueAccent.withOpacity(0.9),
          fitInsideHorizontally: true,
          fitInsideVertically: true,
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((LineBarSpot barSpot) {
              final index = barSpot.x.toInt();

              final formattedDate = DateTime.parse(dates[index]).toVEDate();

              return LineTooltipItem(
                '${isCrypto ? '\$' : 'Bs.'} ${prices[index]}\n',
                lineTooltipItemTextStyle,
                children: [
                  TextSpan(
                    text: '$formattedDate\n',
                    style: lineTooltipItemTextStyle,
                  ),
                  TextSpan(
                    text: hours[index],
                    style: lineTooltipItemTextStyle,
                  ),
                ],
              );
            }).toList();
          },
        ));

    const gridData = FlGridData(
      show: true,
    );

    final borderData = FlBorderData(
      show: false,
    );

    final rightSideTitles = SideTitles(
      getTitlesWidget: leftTitleWidgets,
      showTitles: true,
      reservedSize: 24,
    );

    final leftSideTitles = SideTitles(
      getTitlesWidget: leftTitleWidgets,
      showTitles: !isCrypto,
      reservedSize: 24,
    );

    const topTitles = AxisTitles(
      sideTitles: SideTitles(
        showTitles: false,
      ),
    );

    final rightTitles = isCrypto
        ? AxisTitles(
            axisNameSize: 20.0,
            sideTitles: rightSideTitles,
          )
        : const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          );

    final bottomSideTitles = SideTitles(
      getTitlesWidget: bottomTitleWidgets,
      showTitles: true,
      reservedSize: 20,
    );

    final bottomTitles = AxisTitles(
      axisNameWidget: const Text(
        'Fecha',
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      axisNameSize: 20.0,
      sideTitles: bottomSideTitles,
    );

    final leftTitles = AxisTitles(
      axisNameWidget: Text(
        'Precio (${isCrypto ? '\$' : 'Bs.'})',
        style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
      ),
      axisNameSize: 20.0,
      sideTitles: leftSideTitles,
    );

    final titlesData = FlTitlesData(
      topTitles: topTitles,
      rightTitles: rightTitles,
      bottomTitles: bottomTitles,
      leftTitles: leftTitles,
    );

    final List<FlSpot> spotsList = [
      for (int i = 0; i < prices.length; i++) FlSpot(i.toDouble(), prices[i])
    ];

    final lineChartBarData = LineChartBarData(
      isCurved: true,
      curveSmoothness: 0,
      color: Colors.blueAccent,
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(
        show: true,
        color: Colors.blueAccent.withOpacity(0.2),
      ),
      spots: spotsList,
    );

    final lineChartData = LineChartData(
      minX: 0,
      maxX: prices.length - 1.0,
      minY: minBound,
      maxY: maxBound,
      lineTouchData: lineTouchData,
      gridData: gridData,
      borderData: borderData,
      titlesData: titlesData,
      lineBarsData: [
        lineChartBarData,
      ],
    );

    return LineChart(
      lineChartData,
      duration: const Duration(milliseconds: 2500),
    );
  }
}
