import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class WaitingScreen extends StatefulWidget {
  Function changeHasFetched;
  WaitingScreen(this.changeHasFetched);

  @override
  _WaitingScreenState createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {
  Timer _timer;
  _WaitingScreenState() {
    _timer = Timer(Duration(seconds: 3), () {
      widget.changeHasFetched();
    });
  }
  var rng = new Random();
  int rn = 0;
  void onTabTapped(int index) {
    setState(() {
    });
  }
  @override
  void initState() {
    super.initState();
    rn = rng.nextInt(3);
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stay Safe'),
        backgroundColor: Colors.red,
      ),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color.fromARGB(255, 247, 247, 247),
          height: 60,
          animationCurve: Curves.fastOutSlowIn,
          color: Color.fromARGB(255, 255, 220, 220),
          index: 1,
          onTap: (index) {
            onTabTapped(index);
          }, // new
          items: <Widget>[
            Icon(Icons.add, color: Colors.red),
            Icon(Icons.list, color: Colors.red)
          ]),
      body: Material(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 40, bottom: 30, left: 20, right: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: LinearProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.red[600])),
                  ),
                ),
              ),
              Center(
                  child: rn == 0
                      ? Text('Crunching Numbers...',
                          style:
                              TextStyle(color: Colors.red[600], fontSize: 24))
                      : rn == 1
                          ? Text('Loading Data...',
                              style: TextStyle(
                                  color: Colors.red[600], fontSize: 24))
                          : Text('Extracting Hidden Data...',
                              style: TextStyle(
                                  color: Colors.red[600], fontSize: 24)))
            ],
          ),
        ),
      ),
    );
  }
}
