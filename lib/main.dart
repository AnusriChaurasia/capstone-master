//import 'package:capstone/Screens/Welcome/welcome_screen.dart';

import 'package:capstone/Screens/Home/home_screen.dart';
// ignore: unused_import
import 'package:capstone/Screens/Login/login_screen.dart';
import 'package:capstone/Screens/Profile/profile_screen.dart';
import 'package:capstone/Screens/Welcome/welcome_screen.dart';
import 'package:capstone/Screens/budget_screen.dart';
// ignore: unused_import
import 'package:capstone/shared/nav.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Screens/Invest/invest_screen.dart';
import 'Screens/Learn/learn_screen.dart';


//import 'package:capstone/Screens/Welcome/welcome_screen.dart';
// ignore: duplicate_import
import 'package:firebase_core/firebase_core.dart';
// ignore: duplicate_import
import 'package:flutter/material.dart';

//import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

/*class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key : key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

  void signup() async{
    try{
      await firebaseAuth.createUserWithEmailAndPassword(email: "anusrichaurasia@gmail.com", password: "anusri234");
    }
    catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("firebase"),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              signup();
            },
            child: Text("Signup"),
          )
        ),
      ),
    );
  }
}*/

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Capstone Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      // Named Routes
      routes: {
        //'/': (context) => SignInPage(),
        '/profile': (context) => Profile(),
        '/learn': (context) => Learn(),
        '/invest': (context) => Invest(),
        '/home': (context) => Home(),
        '/budget': (context) => Budget(),
      },

      home: WelcomeScreen(),
    );
  }
}
