import 'package:capstone/Screens/Home/home_screen.dart';
import 'package:capstone/Screens/Profile/profile_screen.dart';
import 'package:capstone/Screens/Welcome/welcome_screen.dart';
import 'package:capstone/Screens/budget_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screens/Invest/invest_screen.dart';
import 'Screens/Learn/learn_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Capstone Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
 // Named Routes
      routes: {
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
