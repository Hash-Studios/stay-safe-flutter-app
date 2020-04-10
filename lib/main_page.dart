import './mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import './infoscreen.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [InfoScreen(), MainScreen()];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      appBar: AppBar(title:Text('Stay Safe'),
        backgroundColor: Colors.red,
      ),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color.fromARGB(255, 247, 247, 247),
          height: 60,
          animationCurve: Curves.fastOutSlowIn,
          color: Color.fromARGB(255, 255, 220, 220),
          onTap: (index) {
            onTabTapped(index);
          }, // new
          items: <Widget>[
            Icon(Icons.info, color: Colors.red),
            Icon(Icons.list, color: Colors.red)
          ]),
    );
  }
}
