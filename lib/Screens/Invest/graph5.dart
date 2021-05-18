import 'package:capstone/Shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

enum LegendShape { Circle, Rectangle }
class GraphE extends StatefulWidget {
  @override
  _GraphEState createState() => _GraphEState();
}

class _GraphEState extends State<GraphE> {

  Map<String, double> dataMap = {
    "Stock": 5,
    "BitCoin": 3,
    "Mutual Funds": 2,
    "Virtual Gold": 2,
  };

  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
  ];

  bool _showCenterText = true;
  bool _showLegendsInRow = false;
  bool _showLegends = true;
  bool _showChartValues = true;
  bool _showChartValuesOutside = false;
  int key = 0;

  @override
  Widget build(BuildContext context) {
    final chart = PieChart(
      key: ValueKey(key),
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 70,
      chartRadius: MediaQuery.of(context).size.width / 1.5,
      colorList: colorList,
      
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      centerText: _showCenterText ? "INVEST" : null,
      ringStrokeWidth:50,
      legendOptions: LegendOptions(
        showLegendsInRow: _showLegendsInRow,
        legendPosition: LegendPosition.bottom,
        showLegends: _showLegends,
        legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: false,
        showChartValues: _showChartValues,
        showChartValuesInPercentage: true,
        showChartValuesOutside: _showChartValuesOutside,
      ),
      //ringStrokeWidth: _ringStrokeWidth,
      emptyColor: Colors.grey,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Investment Options"),
        backgroundColor: kPrimaryColor,
      ),
      body: LayoutBuilder(
        // ignore: missing_return
        builder: (_, constraints) {
          if (constraints.maxWidth >= 600) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: chart,
                ),
              ],
            );
          } 
          else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: chart,
                    margin: EdgeInsets.symmetric(
                      vertical: 80,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}