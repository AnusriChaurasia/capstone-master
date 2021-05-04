import 'package:flutter/material.dart';



Widget appBar(BuildContext context){
  return Center(
    child: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style:TextStyle(fontSize: 24,),
        children: <TextSpan>[
          TextSpan(text: 'Grill', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green[600])),
          TextSpan(text: 'Drive', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
        ],
      ),
      
    ),
  );
}

/**/