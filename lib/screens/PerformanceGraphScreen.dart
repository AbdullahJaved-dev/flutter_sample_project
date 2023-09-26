import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FlutterChartData {
  final String month;
  final int percent;

  FlutterChartData({required this.month, required this.percent});
}

class PerformanceGraphScreen extends StatefulWidget {
  const PerformanceGraphScreen({super.key});

  @override
  State<PerformanceGraphScreen> createState() => _PerformanceGraphScreenState();
}

class _PerformanceGraphScreenState extends State<PerformanceGraphScreen> {
  final String stMessage =
      "Our Monthly Average Performance Gain since last 2 years is (13.06%)";

  @override
  void dispose() {
    super.dispose();
  }

  List<FlutterChartData> chartData = [
    FlutterChartData(month: "Jan-21", percent: 10),
    FlutterChartData(month: "Feb-21", percent: 40),
    FlutterChartData(month: "Mar-21", percent: 50),
    FlutterChartData(month: "Apr-21", percent: 30),
    FlutterChartData(month: "May-21", percent: 80),
    FlutterChartData(month: "Jun-21", percent: 90),
    FlutterChartData(month: "Jul-21", percent: 100),
    FlutterChartData(month: "Aug-21", percent: 70),
    FlutterChartData(month: "Sep-21", percent: 10),
    FlutterChartData(month: "Oct-21", percent: 20),
    FlutterChartData(month: "Nov-21", percent: 50),
    FlutterChartData(month: "Dec-21", percent: 40),
  ];

  late int showingTooltip;

  @override
  void initState() {
    super.initState();
    showingTooltip = -1;
  }

  List<BarChartGroupData> generateGroupData() {
    List<BarChartGroupData> data = [];
    for (var index = 0; index < chartData.length; index++) {
      data.add(BarChartGroupData(
        x: index,
        showingTooltipIndicators: showingTooltip == index ? [0] : [],
        barRods: [
          BarChartRodData(
            toY: chartData[index].percent.toDouble(),
            color: Colors.blue,
            width: 16,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
                bottomLeft: Radius.zero,
                bottomRight: Radius.zero),
          ),
        ],
      ));
    }
    return data;
  }

  FlBorderData get borderData => FlBorderData(
      show: true,
      border: const Border(bottom: BorderSide(), left: BorderSide()));

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    );
    String text = chartData[value.toInt()].month;
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  Widget getYAxisTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    );
    String text = "${value.toInt()} %";
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
              showTitles: true, reservedSize: 30, getTitlesWidget: getTitles),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 50,
              getTitlesWidget: getYAxisTitles),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.blue,
              ),
            );
          }),
          title: const Text(
            "Performance",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: const Color(0xFFe8c65b),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  stMessage.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 32),
              SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 2.5,
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.start,
                      groupsSpace: 50,
                      barGroups: generateGroupData(),
                      barTouchData: barTouchData,
                      titlesData: titlesData,
                      borderData: borderData,
                      gridData: const FlGridData(show: true),
                      maxY: 120,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            );
          },
        ),
      );
}
