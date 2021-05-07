import 'package:flutter/material.dart';

class Learn extends StatefulWidget {
  Learn({Key key}) : super(key: key);

  @override
  _LearnState createState() => _LearnState();
}

class _LearnState extends State<Learn> {
  @override
  Widget build(BuildContext context) {
     return Container(
       child: Center(
         child: Text('Hey You are in Budget section!!'),
       ),
    );
  }
}