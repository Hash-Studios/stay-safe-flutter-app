import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Material(
        color: Color.fromARGB(255, 247, 247, 247),
        child: SafeArea(
            child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 26,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Card(
                        color: Color.fromARGB(255, 240, 240, 240),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/images/Untitled-15.jpg"),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 20),
                              child: Text(
                                'Symtomps of COVID-19',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 45, 56, 75)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(borderRadius: BorderRadius.circular(25),
                                            child: MaterialButton(
                          onPressed: () {
                            _scaffoldKey.currentState.showSnackBar(SnackBar(
                              duration: Duration(milliseconds: 300),
                              content: Text('Stay Safe'),
                            ));
                          },
                          onLongPress: () {
                            launch("https://codenameakshay.tech");
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 16,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Card(
                      color: Color.fromARGB(255, 247, 247, 247),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                        "assets/images/Untitled-6.jpg")),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                        "assets/images/Untitled-8.jpg")),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                        "assets/images/Untitled-7.jpg")),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                        "assets/images/Untitled-5.jpg")),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                        "assets/images/Untitled-9.jpg")),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                        "assets/images/Untitled-4.jpg")),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 16,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Card(
                        color: Color.fromARGB(255, 247, 247, 247),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: Image.asset("assets/images/Untitled-14.png")),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 20),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Click here to visit WHO',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 45, 56, 75)),
                                  ),
                                  Text(
                                    'site for more details',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 45, 56, 75)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(borderRadius: BorderRadius.circular(25),
                                            child: MaterialButton(
                          onPressed: () {
                            launch(
                                "https://www.who.int/emergencies/diseases/novel-coronavirus-2019");
                          },
                          onLongPress: () {},
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(flex: 1, child: Container()),
            ],
          ),
        )),
      ),
    );
  }
}
