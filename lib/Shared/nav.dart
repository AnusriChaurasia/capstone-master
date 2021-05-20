import 'package:capstone/Screens/Learn/topics.dart';
import 'package:capstone/Shared/constants.dart';
import 'package:capstone/Screens/screens.dart';
import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  Nav({Key key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 2;
  List<Widget> _widgetOptions = <Widget>[
    TopicsScreen(),
    Invest(),
    Home(),
    Budget(),
    Profile(),
  ];
  void _onItemTap(int index) {
    setState(() {_selectedIndex = index;});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title: Text('BillMatter', style: TextStyle(color: kPrimaryColorPink,),),
=======
        title: Text(
          'BillMatter',
          style: TextStyle(
<<<<<<< HEAD
            color: kPrimaryColor,
          ),
        ),
=======
            color: kPrimaryColorPink,
        ),),
>>>>>>> e2e79fcd3355864c4645c8565b547fa8765179f6
>>>>>>> b7e9a5b3c423387ff4c723e6065a0e8d1de380e7
        elevation: 0,
        backgroundColor: kPrimaryLightColor,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.lightbulb_outline,), label: 'Learn',),
          BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: 'Invest',),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',),
          BottomNavigationBarItem(icon: Icon(Icons.pie_chart_outlined), label: 'Budget',),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile',),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedItemColor: kActiveIconColor,
        unselectedItemColor: kInactiveIconColor,
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
