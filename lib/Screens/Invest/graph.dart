import 'package:capstone/Shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Graph extends StatefulWidget {
  @override
  _GraphState createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  Map<String, double> dataMap = { 
    "BitCoin": 4.5,
    "Mutual Funds": 3.6,
    "Stock": 2.4,
    "Virtual Gold": 1.2,
  };
  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
  ];

  int key = 0;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final chart = PieChart(
      key: ValueKey(key),
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 70,
      chartRadius: MediaQuery.of(context).size.width / 1.5,
      colorList: colorList,
      
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      // ignore: dead_code
      centerText: true ? "INVEST" : null,
      ringStrokeWidth:50,
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.bottom,
        showLegends: true,
        legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(fontWeight: FontWeight.bold,),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: false,
        showChartValues: true,
        showChartValuesInPercentage: true,
        showChartValuesOutside: false,
      ),
      emptyColor: Colors.grey,
    );
    
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color:Colors.black,
        ),
        title: Text("Investment Options"),
        backgroundColor: kPrimaryLightColor,

      ),
      body: Container(
        child:chart, 
        
      ),
    );
  }
    
  

  
}