import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bargraph/bar_data.dart';

class MyBarGraph extends StatelessWidget {

  final double? maxY;
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;

  const MyBarGraph({super.key, required this.maxY, required this.sunAmount, required this.monAmount, required this.tueAmount, required this.friAmount, required this.satAmount, required this.thurAmount, required this.wedAmount});

  @override
  Widget build(BuildContext context) {

    BarData myBarData = BarData(sunAmount: sunAmount, friAmount: friAmount, monAmount: monAmount, satAmount: satAmount, thurAmount: thurAmount, tueAmount: tueAmount, wedAmount: wedAmount);
    myBarData.initializeBarData();

    return BarChart(
      BarChartData(
        maxY: 100,
        minY: 0,
        barGroups: myBarData.barData.map((e) => BarChartGroupData(x: e.x , barRods: [
          BarChartRodData(toY: e.y)
        ])).toList()
      )
    );
  }
}