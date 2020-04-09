import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

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
