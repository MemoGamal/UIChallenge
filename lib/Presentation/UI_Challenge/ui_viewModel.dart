// Graph Be Presented by Two Axis-- Y-Axis.. And X-Axis..

// Y-Axis be determined based on "Budget" Value..
// The location on linear graph will be based on value it self ..for ex.. 100
// 101 and 250..

// X-axis is based on number of elements.. 30 days because it's number of
// Days in A month..

// On tap on specific point on the graph vertical and horizontal line show up..
// and value of specific point for ex.. 250$..

// Will be using fl_chart

// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_challenge/Presentation/base/base_viewModel.dart';
import 'package:ui_challenge/Presentation/constants/constants.dart';

class UIViewModel extends BaseViewModel
    with Ui_ViewModelInputs, Ui_ViewModelOutPuts {
  // Stream Controller..
  final StreamController _streamController = StreamController();
  @override
  //inputs
  Sink get Ui_ViewModelinputs => _streamController.sink;

  @override
  //outputs
  Stream get Ui_ViewModeloutputs =>
      _streamController.stream.map((event) => event);

  @override
  void dispose() {
    // Use later on to dispose..
  }
  var GraphWidget;
  final FlLine indicatorLine = FlLine();
  final FlDotData touchedSpot = FlDotData();
  var gradientColour = LinearGradient(colors: [
    Colours.white,
    Colours.primaryColour,
  ]);
  List<TouchedSpotIndicatorData?> mylist = [];
  List<LineTooltipItem?> TesttoolTip = [];

// Testing
  @override
  void linearGraph() {
    GraphWidget = LineChart(
      // LineTouchTooltipData()
      LineChartData(
        betweenBarsData: [],
        // showingTooltipIndicators: ,

        lineTouchData: LineTouchData(
          // Box Above Dot...

          touchTooltipData: LineTouchTooltipData(
// getTooltipItems: (touchedSpots) {

// },            showOnTopOfTheChartBoxArea: false,

            tooltipBgColor: Colours.primaryColour,
            tooltipRoundedRadius: Constants.borderRadius,

            // getTooltipItems: (touchedSpots) {
            //   print("Testing");
            //   return TesttoolTip;
            // },
          ),

          touchCallback: (p0, p1) {
            // True When Clicked on Specific dot..
            // print(TouchedSpotIndicatorData(indicatorBelowLine, touchedSpotDotData));
            FlGridData(
              checkToShowHorizontalLine: (value) {
                value = p1?.lineBarSpots as double;
                return true;
              },
              checkToShowVerticalLine: (value) {
                value = p1?.lineBarSpots as double;
                return true;
              },
            );
            // print("Touched");
            // print("------------------------");
          },
          enabled: true,
          // handleBuiltInTouches: ,
          handleBuiltInTouches: true,
        ),
        borderData: FlBorderData(
          show: false,
        ),
        gridData: FlGridData(
          show: true,

          // // drawHorizontalLine: Based on Value,
          // checkToShowHorizontalLine: (value) {
          //   value = 20;
          //   return true;
          // },
          drawHorizontalLine: false,
          drawVerticalLine: false,
        ),
        titlesData: FlTitlesData(
          show: true,

          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          // Top Titles
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        // lineTouchData: TouchedSpotIndicatorData(indicatorBelowLine, touchedSpotDotData),

        lineBarsData: [
          LineChartBarData(
            // gradient: gradientColour,

            color: Colours.primaryColour,

            isCurved: true,
            dotData: FlDotData(
              show: false,

              // checkToShowDot: (spot, barData) {
              //   return showAllDots(spot, barData);
              // },
            ),

            barWidth: Constants.barWidth,
            show: true,
            // Dash Byseb Msafa
            // dashArray: [
            //   1,
            // ],
            isStrokeCapRound: true,
            // Below Bar ..
            belowBarData: BarAreaData(
              show: false,
            ),
            // curveSmoothness: 1,
            spots: [
              const FlSpot(1, 10),
              const FlSpot(2, 10),
              const FlSpot(3, 7),
              const FlSpot(4, 12),
              const FlSpot(5, 13),
              const FlSpot(6, 17),
              const FlSpot(7, 15),
              const FlSpot(8, 14),
              const FlSpot(9, 25),
              const FlSpot(10, 6),
              const FlSpot(11, 5),
              const FlSpot(12, 14),
              const FlSpot(13, 12),
              const FlSpot(14, 15),
              const FlSpot(15, 13),
              const FlSpot(16, 12),
              const FlSpot(17, 10),
              const FlSpot(18, 15),
              const FlSpot(19, 24),
              const FlSpot(20, 23),
              const FlSpot(21, 15),
              const FlSpot(22, 25),
              const FlSpot(23, 24),
              const FlSpot(24, 23),
              const FlSpot(25, 15),
              const FlSpot(26, 25),
              const FlSpot(27, 23),
              const FlSpot(28, 16),
              const FlSpot(29, 17),
              const FlSpot(30, 18),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void start() {
    linearGraph();
    postDataToui();
  }

  void postDataToui() {
    Ui_ViewModelinputs.add(GraphWidget);
  }

  void onTouched() {}
}

abstract class Ui_ViewModelInputs {
  void linearGraph();
  // void budgetList();
  Sink get Ui_ViewModelinputs;
}

abstract class Ui_ViewModelOutPuts {
  Stream get Ui_ViewModeloutputs;
}
