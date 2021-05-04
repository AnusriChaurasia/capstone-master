import 'package:capstone/budget_screen.dart';
import 'package:capstone/home_screen.dart';
import 'package:capstone/invest_screen.dart';
import 'package:capstone/learn_screen.dart';
import 'package:capstone/profile_screen.dart';
import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  Nav({Key key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {

  int _selectedIndex = 2;
  List<Widget> _widgetOptions = <Widget>[
    Learn(),
    Invest(),
    Home(),
    Budget(),
    Profile(),
  ];

  void _onItemTap(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FinExpress'),),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text('Learn'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            title: Text('Invest'),
          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            title: Text('Budget'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),          
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTap,
      backgroundColor: Colors.blue[400],
      selectedItemColor: Colors.black87,
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      )
      ,
    );
  }
}