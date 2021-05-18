//import 'package:fl_chart/fl_chart.dart';
import 'package:capstone/Shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

//import 'graph2.dart';

enum LegendShape { Circle, Rectangle }

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

  //ChartType _chartType = ChartType.disc;
  bool _showCenterText = true;
  //double _ringStrokeWidth = 32;
  //double _chartLegendSpacing = 50;

  bool _showLegendsInRow = false;
  bool _showLegends = true;

  // ignore: unused_field
  bool _showChartValueBackground = true;
  // ignore: unused_field
  bool _showChartValues = true;
  // ignore: unused_field
  bool _showChartValuesInPercentage = false;
  // ignore: unused_field
  bool _showChartValuesOutside = false;

  
  //LegendShape _legendShape = LegendShape.Circle;
  //LegendPosition _legendPosition = LegendPosition.right;

  int key = 0;
  @override
  Widget build(BuildContext context) {
    final chart = PieChart(
      key: ValueKey(key),
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 70,
      chartRadius: MediaQuery.of(context).size.width / 1.5,
      // MediaQuery.of(context).size.width / 3.2 > 300
      //    ? 300
        //  :
      colorList: colorList,
      
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      centerText: _showCenterText ? "INVEST" : null,
      ringStrokeWidth:50,
      legendOptions: LegendOptions(
        showLegendsInRow: _showLegendsInRow,
        legendPosition: LegendPosition.bottom,
        showLegends: _showLegends,
        /*legendShape: _legendShape == LegendShape.Circle
            ? BoxShape.circle
            : BoxShape.rectangle,*/
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

    /*final settings = SingleChildScrollView(
      child: Card(
        margin: EdgeInsets.all(12),
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Pie Chart Options'.toUpperCase(),
                style: Theme.of(context).textTheme.overline.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            ListTile(
              title: Text("chartType"),
              trailing: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownButton<ChartType>(
                  value: _chartType,
                  items: [
                    DropdownMenuItem(
                      child: Text("disc"),
                      value: ChartType.disc,
                    ),
                    DropdownMenuItem(
                      child: Text("ring"),
                      value: ChartType.ring,
                    ),
                  ],
                  onChanged: (val) {
                    setState(() {
                      _chartType = val;
                    });
                  },
                ),
              ),
            ),
            ListTile(
              title: Text("ringStrokeWidth"),
              trailing: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownButton<double>(
                  value: _ringStrokeWidth,
                  disabledHint: Text("select chartType.ring"),
                  items: [
                    DropdownMenuItem(
                      child: Text("16"),
                      value: 16,
                    ),
                    DropdownMenuItem(
                      child: Text("32"),
                      value: 32,
                    ),
                    DropdownMenuItem(
                      child: Text("48"),
                      value: 48,
                    ),
                  ],
                  onChanged: (_chartType == ChartType.ring)
                      ? (val) {
                          setState(() {
                            _ringStrokeWidth = val;
                          });
                        }
                      : null,
                ),
              ),
            ),
            SwitchListTile(
              value: _showCenterText,
              title: Text("showCenterText"),
              onChanged: (val) {
                setState(() {
                  _showCenterText = val;
                });
              },
            ),
            ListTile(
              title: Text("chartLegendSpacing"),
              trailing: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownButton<double>(
                  value: _chartLegendSpacing,
                  disabledHint: Text("select chartType.ring"),
                  items: [
                    DropdownMenuItem(
                      child: Text("16"),
                      value: 16,
                    ),
                    DropdownMenuItem(
                      child: Text("32"),
                      value: 32,
                    ),
                    DropdownMenuItem(
                      child: Text("48"),
                      value: 48,
                    ),
                    DropdownMenuItem(
                      child: Text("64"),
                      value: 64,
                    ),
                  ],
                  onChanged: (val) {
                    setState(() {
                      _chartLegendSpacing = val;
                    });
                  },
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Legend Options'.toUpperCase(),
                style: Theme.of(context).textTheme.overline.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SwitchListTile(
              value: _showLegendsInRow,
              title: Text("showLegendsInRow"),
              onChanged: (val) {
                setState(() {
                  _showLegendsInRow = val;
                });
              },
            ),
            SwitchListTile(
              value: _showLegends,
              title: Text("showLegends"),
              onChanged: (val) {
                setState(() {
                  _showLegends = val;
                });
              },
            ),
            ListTile(
              title: Text("legendShape"),
              trailing: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownButton<LegendShape>(
                  value: _legendShape,
                  items: [
                    DropdownMenuItem(
                      child: Text("BoxShape.circle"),
                      value: LegendShape.Circle,
                    ),
                    DropdownMenuItem(
                      child: Text("BoxShape.rectangle"),
                      value: LegendShape.Rectangle,
                    ),
                  ],
                  onChanged: (val) {
                    setState(() {
                      _legendShape = val;
                    });
                  },
                ),
              ),
            ),
            ListTile(
              title: Text("legendPosition"),
              trailing: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownButton<LegendPosition>(
                  value: _legendPosition,
                  items: [
                    DropdownMenuItem(
                      child: Text("left"),
                      value: LegendPosition.left,
                    ),
                    DropdownMenuItem(
                      child: Text("right"),
                      value: LegendPosition.right,
                    ),
                    DropdownMenuItem(
                      child: Text("top"),
                      value: LegendPosition.top,
                    ),
                    DropdownMenuItem(
                      child: Text("bottom"),
                      value: LegendPosition.bottom,
                    ),
                  ],
                  onChanged: (val) {
                    setState(() {
                      _legendPosition = val;
                    });
                  },
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Chart values Options'.toUpperCase(),
                style: Theme.of(context).textTheme.overline.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SwitchListTile(
              value: _showChartValueBackground,
              title: Text("showChartValueBackground"),
              onChanged: (val) {
                setState(() {
                  _showChartValueBackground = val;
                });
              },
            ),
            SwitchListTile(
              value: _showChartValues,
              title: Text("showChartValues"),
              onChanged: (val) {
                setState(() {
                  _showChartValues = val;
                });
              },
            ),
            SwitchListTile(
              value: _showChartValuesInPercentage,
              title: Text("showChartValuesInPercentage"),
              onChanged: (val) {
                setState(() {
                  _showChartValuesInPercentage = val;
                });
              },
            ),
            SwitchListTile(
              value: _showChartValuesOutside,
              title: Text("showChartValuesOutside"),
              onChanged: (val) {
                setState(() {
                  _showChartValuesOutside = val;
                });
              },
            ),
          ],
        ),
      ),
    );*/

    return Scaffold(
      appBar: AppBar(
        title: Text("Investment Options"),
        backgroundColor: kPrimaryColor,
        /*actions: [
          
          ElevatedButton(
            onPressed: () {
              setState(() {
                key = key + 1;
              });
            },
            child: Text("Reload".toUpperCase()),
          ),
        ],*/

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
                /*Flexible(
                  flex: 1,
                  child: settings,
                )*/
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
                  //settings,
                ],
              ),
            );
          }
        },
      ),
    );
  }
    
  

  
}