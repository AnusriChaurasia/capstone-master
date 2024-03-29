import 'package:capstone/Screens/Invest/chartPos.dart';
import 'package:capstone/Screens/Invest/graph.dart';
import 'package:capstone/Screens/Invest/graph2.dart';
import 'package:capstone/Screens/Invest/graph3.dart';
import 'package:capstone/Screens/Invest/graph4.dart';
import 'package:capstone/Screens/Invest/graph5.dart';
import 'package:capstone/Shared/constants.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Invest extends StatefulWidget {
  @override
  _InvestState createState() => _InvestState();
}

class _InvestState extends State<Invest> {
  TextEditingController _amountController, _durationController;
  List data =[];
  DatabaseReference _ref;
  String _myActivity;
  final formKey = new GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
    _durationController = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('Investment Details');
    _myActivity = '';
    
  }
   Widget build(BuildContext context) {
    return Scaffold( 
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100),
            textItem("Amount",_amountController, false),
            SizedBox(height: 15),
            textItem("Duration",_durationController, false),
            SizedBox(height: 15,),
            SingleChildScrollView(
              //color: Colors.white,
              child: DropDownFormField(
                required: true,
                errorText: 'Please select one option',
                contentPadding: const EdgeInsets.fromLTRB(12, 12, 8, 0),
                titleText: 'Investment Month',
                value: _myActivity,
              
                onSaved: (value) {setState(() {_myActivity = value;});},
                onChanged: (value) {setState(() {_myActivity = value;});},
                dataSource: [
                  {"display": "January","value": "January",},
                  {"display": "Feburary","value": "Feburary",},
                  {"display": "March","value": "March",},
                  {"display": "April","value": "April",},
                  {"display": "May","value": "May",},
                  {"display": "June","value": "June",},
                  {"display": "July","value": "July",},
                  {"display": "August","value": "August",},
                  {"display": "September","value": "September",},
                  {"display": "October","value": "October",},
                  {"display": "November","value": "November",},
                  {"display": "December","value": "December",},
                ],
                textField: 'display',
                valueField: 'value',
              ),
            ),
           SizedBox(height: 50,),

           Center( 
             child: Container(
               width: 80,
               padding: EdgeInsets.symmetric(horizontal: 10),
               child: ElevatedButton(
                 child: Text('Go',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600,),),
                  style: ElevatedButton.styleFrom(primary: Colors.purple,),
                  onPressed: (){
                    saveDetails();
                    setState(()
                    {data.add(int.parse(_amountController.text));
                    data.add(int.parse(_durationController.text));});
                    var amt = int.parse(_amountController.text);
                    var dur = int.parse(_durationController.text);
                    if(amt <= 10000 && dur <= 6){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Graph()));  
                    }
                    else if((amt>10000 && amt<=20000) && (dur>6 && dur<=18)){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => GraphB()));
                    }
                    else if((amt>20000 && amt<=30000) && (dur>18 && dur<=36)){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => GraphC()));
                    }
                    else if((amt>30000 && amt<=40000) && (dur>36 && dur<=60)){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => GraphD()));
                    }
                    else if((amt>40000 && amt<=50000) && (dur>60 && dur<=84)){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => GraphE()));
                    }
                    else {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => ChartPos()));
                    }                     
                  }  
                ),
              ),
            ),
            //Text(data.toString()),

          ],
        ),
      ),
    );
  }

  void saveDetails(){
    String amount = _amountController.text;
    String duration = _durationController.text;
    String month = _myActivity;
    Map<String,String> contact = {
      'Amount':amount,
      'Duration': duration,
      'Month' : month,
    };
    _ref.push().set(contact);
  }

  Widget textItem(
    String labeltext, TextEditingController controller, bool obscureText) {
      return Container(
        margin: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width ,
      height: 55,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(
          fontSize: 17,
          color: kPrimaryColorPink,
        ),
        decoration: InputDecoration(
          labelText: labeltext,
          labelStyle: TextStyle(
            fontSize: 17,
            color: kPrimaryColorPurple,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 1.5,
              color: kPrimaryColorPink,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 1,
              color: kPrimaryColorPurple,
            ),
          ),
        ),
      ),
    );
  }

  
}

