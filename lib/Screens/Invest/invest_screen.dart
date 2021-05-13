import 'package:capstone/Screens/Invest/chart_screen.dart';
import 'package:capstone/Shared/constants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Invest extends StatefulWidget {
  @override
  _InvestState createState() => _InvestState();
}

class _InvestState extends State<Invest> {

  // ignore: unused_field
  TextEditingController _amountController, _durationController;

  DatabaseReference _ref;

  @override
  void initState(){
    super.initState();
    _amountController = TextEditingController();
    _durationController = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('Investment Details');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
       body: Container(
         margin: EdgeInsets.all(30),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           children: <Widget>[

             SizedBox(height:100),

             TextFormField(
               controller: _amountController,
               textAlign: TextAlign.center,
               decoration: InputDecoration(
                 border: UnderlineInputBorder(),
                 hintText: 'Amount',
                 fillColor: kPrimaryLightColor,
                 filled: true,
                 contentPadding: EdgeInsets.all(15),
               ),
             ),

             SizedBox(height:30),

             TextFormField(
               controller: _durationController,
               textAlign: TextAlign.center,
               decoration: InputDecoration(
                 border: UnderlineInputBorder(),
                 hintText: 'Duration',
                 fillColor: kPrimaryLightColor,
                 filled: true,
                 contentPadding: EdgeInsets.all(15),
               ),
             ),

             SizedBox(height:40),

             Container(
               width:90,
               height: 70,
               padding: EdgeInsets.all(10),
               child: RaisedButton(
                 color: kPrimaryLightColor,
                 
                 child: Text(
                   'Go',
                   style: TextStyle(
                     color: Colors.teal[700],
                     fontWeight: FontWeight.w800,
                     fontSize: 30,
                     fontFamily: 'San-serif',
                   ),
                 ),
                 onPressed: (){
                   save();
                   Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Chart();
                      },
                    ),
                );
                 }
                 ),
             ),


           ],
         ),
       ),
    );
  }
  void save(){
    String amount = _amountController.text;
    String duration = _durationController.text; 
    
    Map<String,String> details = {
      'amount': amount,
      'duration': duration,
    };

    _ref.push().set(details).then((value) {
      Navigator.pop(context);
    });

  }
}