import 'package:capstone/Shared/constants.dart';
import 'package:capstone/Shared/nav.dart';
import 'package:flutter/material.dart';

class ChartPos extends StatefulWidget {
  @override
  _ChartPosState createState() => _ChartPosState();
}

class _ChartPosState extends State<ChartPos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color:Colors.black,
        ),
        title: Text("Amount-Duration Table"),
        backgroundColor: kPrimaryLightColor,

      ),
      body: ListView(children: <Widget>[  
            
            Center(
              
              child: Container(
                margin: EdgeInsets.only(top:50, bottom: 250,),
                child: DataTable(  
                  columns: [    
                    DataColumn(label: Text(  
                        'Amount',  
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kPrimaryColorPurple)  
                    )),  
                    DataColumn(label: Text(  
                        'Duration',  
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kPrimaryColorPurple)  
                    )),  
                  ],  
                  rows: [  
                    DataRow(cells: [  
                        
                      DataCell(Text('100-10000')),  
                      DataCell(Text('0-6 Months')),  
                    ]),  
                    DataRow(cells: [  
                        
                      DataCell(Text('10000-20000')),  
                      DataCell(Text('6-18 Months')),  
                    ]),  
                    DataRow(cells: [  
                        
                      DataCell(Text('20000-30000')),  
                      DataCell(Text('18-36 Months')),  
                    ]),  
                    DataRow(cells: [  
                        
                      DataCell(Text('30000-40000')),  
                      DataCell(Text('36-60 Months')),  
                    ]),
                    DataRow(cells: [  
                        
                      DataCell(Text('40000-50000')),  
                      DataCell(Text('60-84 Months')),  
                    ]),  
                  ],  
                ),
              ),
 
            ),  
          Center(
            child: Container(
              width: double.infinity,
              height: 70.0,
              padding: EdgeInsets.only(top:10, bottom:10),
              // ignore: deprecated_member_use
              child: RaisedButton(
                focusColor: kPrimaryLightColor,
                child: Text('Back',
                style: TextStyle(
                  fontSize: 24,
                ),
                ),
                color: kPrimaryColorPink,
                textColor: kPrimaryColorPurple,
                onPressed:(){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Nav()));
                }
            ),
          ),
          )
          ]
          )  

         

    );
  }
}


