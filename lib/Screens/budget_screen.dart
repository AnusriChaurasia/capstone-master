import 'package:flutter/material.dart';

class Budget extends StatefulWidget {
  Budget({Key key}) : super(key: key);

  @override
  _BudgetState createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(
         child: Text('Hey You are in Budget section!!'),
       ),
    );
  }
}