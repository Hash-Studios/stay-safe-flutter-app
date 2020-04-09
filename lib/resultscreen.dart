import 'package:flutter/material.dart';
import './blinker.dart';
import 'package:slimy_card/slimy_card.dart';
import './datafetch.dart';
import './waitingscreen.dart';

class ResultScreen extends StatefulWidget {
  String country;
  ResultScreen(this.country);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool hasFetched;
  DragStartDetails start;
  DragUpdateDetails update;
  // Future<Countries> futureCountries;
  Future<List> futureTotal;
  Future<List> futureCountry;
  List listAllValue;
  List allValue;
  Map<String, dynamic> dayValue;
  String dropdownValue;
  int globalC;
  int globalR;
  int globalD;
  @override
  void initState() {
    super.initState();
    allValue = [];
    listAllValue = [];
    // futureCountries = fetchCountries(widget.country);
    futureTotal = fetchGlobalTotal();
    futureCountry = fetchSingleCountry(widget.country);
    hasFetched = false;
  }

  void changeHasFetched() {
    setState(() {
      hasFetched = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return hasFetched
        ? Scaffold(
            body: SafeArea(
              child: Center(
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 247, 247, 247)),
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Expanded(
                              flex: 5,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Center(
                                    child: MyBlinkingButton(
                                        child: Text('Swipe down to refresh'))),
                              )),
                          Expanded(
                              flex: 4,
                              child: LayoutBuilder(
                                  builder: (context, constraints) {
                                return Stack(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 40,
                                              spreadRadius: 6,
                                              color: Colors.black54)
                                        ],
                                        color: Colors.transparent,
                                      ),
                                      width: constraints.maxWidth,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30)),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 247, 247, 247),
                                        ),
                                        width: constraints.maxWidth,
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20,
                                                      horizontal: 30),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    'COVID-19 Tracker',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Color.fromARGB(
                                                          255, 45, 56, 75),
                                                    ),
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        Navigator.pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) {
                                                          return ResultScreen(
                                                              widget.country);
                                                        }));
                                                      },
                                                      icon: Icon(
                                                        Icons.refresh,
                                                        size: 30,
                                                        color: Color.fromARGB(
                                                            255, 45, 56, 75),
                                                      ))
                                                ],
                                              ),
                                            ),
                                            FutureBuilder<List>(
                                              future: futureTotal,
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  try {
                                                    globalC = snapshot.data[0];
                                                    globalR = snapshot.data[1];
                                                    globalD = snapshot.data[2];
                                                    return Column(
                                                      children: <Widget>[
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Card(
                                                            elevation: 0,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    209,
                                                                    235,
                                                                    254),
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                SizedBox(
                                                                  width: constraints
                                                                          .maxWidth -
                                                                      24,
                                                                  child:
                                                                      DropdownButton<
                                                                          String>(
                                                                    value:
                                                                        dropdownValue,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            20),
                                                                    autofocus:
                                                                        true,
                                                                    hint: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: <
                                                                          Widget>[
                                                                        Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8.0),
                                                                            child: Image.asset("icon/earth.png")),
                                                                        Text(
                                                                            'Global Status                  '),
                                                                        Text(
                                                                          snapshot
                                                                              .data[0]
                                                                              .toString(),
                                                                          style:
                                                                              TextStyle(color: Color.fromARGB(255, 254, 123, 88)),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    icon: Icon(
                                                                      Icons
                                                                          .arrow_downward,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          45,
                                                                          56,
                                                                          75),
                                                                    ),
                                                                    onChanged:
                                                                        (String
                                                                            newData) {},
                                                                    items: <
                                                                        String>[
                                                                      'Global Cases ${snapshot.data[0]}',
                                                                      'Global Recovered ${snapshot.data[1]}',
                                                                      'Global Deaths ${snapshot.data[2]}',
                                                                    ].map<
                                                                        DropdownMenuItem<
                                                                            String>>((String
                                                                        value) {
                                                                      return DropdownMenuItem<
                                                                          String>(
                                                                        value:
                                                                            value,
                                                                        child:
                                                                            Text(
                                                                          value,
                                                                          style:
                                                                              TextStyle(color: Color.fromARGB(255, 45, 56, 75)),
                                                                        ),
                                                                      );
                                                                    }).toList(),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        FutureBuilder<List>(
                                                          future: futureCountry,
                                                          builder: (context,
                                                              snapshot) {
                                                            if (snapshot
                                                                .hasData) {
                                                              try {
                                                                return Column(
                                                                  children: <
                                                                      Widget>[
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: <
                                                                          Widget>[
                                                                        Padding(
                                                                          padding: const EdgeInsets.symmetric(
                                                                              horizontal: 20,
                                                                              vertical: 10),
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: <Widget>[
                                                                              Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: SizedBox(
                                                                                  width: 10,
                                                                                  height: 10,
                                                                                  child: Container(decoration: BoxDecoration(color: Color.fromARGB(255, 68, 133, 253), borderRadius: BorderRadius.circular(2))),
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                'Active Cases',
                                                                                style: TextStyle(
                                                                                  color: Color.fromARGB(255, 45, 56, 75),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.symmetric(
                                                                              horizontal: 20,
                                                                              vertical: 10),
                                                                          child:
                                                                              Text(
                                                                            snapshot.data[0].toString(),
                                                                            style:
                                                                                TextStyle(
                                                                              color: Color.fromARGB(255, 45, 56, 75),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .symmetric(
                                                                          horizontal:
                                                                              28),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                        child:
                                                                            LinearProgressIndicator(
                                                                          value:
                                                                              snapshot.data[0] / globalC,
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            Color.fromARGB(
                                                                                255,
                                                                                68,
                                                                                133,
                                                                                253),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: <
                                                                          Widget>[
                                                                        Padding(
                                                                          padding: const EdgeInsets.symmetric(
                                                                              horizontal: 20,
                                                                              vertical: 10),
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: <Widget>[
                                                                              Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: SizedBox(
                                                                                  width: 10,
                                                                                  height: 10,
                                                                                  child: Container(decoration: BoxDecoration(color: Color.fromARGB(255, 255, 183, 76), borderRadius: BorderRadius.circular(2))),
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                'Inactive Cases',
                                                                                style: TextStyle(
                                                                                  color: Color.fromARGB(255, 45, 56, 75),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.symmetric(
                                                                              horizontal: 20,
                                                                              vertical: 10),
                                                                          child:
                                                                              Text(
                                                                            snapshot.data[1].toString(),
                                                                            style:
                                                                                TextStyle(
                                                                              color: Color.fromARGB(255, 45, 56, 75),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .symmetric(
                                                                          horizontal:
                                                                              28),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                        child:
                                                                            LinearProgressIndicator(
                                                                          value:
                                                                              snapshot.data[1] / globalR,
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            Color.fromARGB(
                                                                                255,
                                                                                255,
                                                                                183,
                                                                                76),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: <
                                                                          Widget>[
                                                                        Padding(
                                                                          padding: const EdgeInsets.symmetric(
                                                                              horizontal: 20,
                                                                              vertical: 10),
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: <Widget>[
                                                                              Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: SizedBox(
                                                                                  width: 10,
                                                                                  height: 10,
                                                                                  child: Container(decoration: BoxDecoration(color: Color.fromARGB(255, 254, 123, 88), borderRadius: BorderRadius.circular(2))),
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                'Deaths',
                                                                                style: TextStyle(
                                                                                  color: Color.fromARGB(255, 45, 56, 75),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.symmetric(
                                                                              horizontal: 20,
                                                                              vertical: 10),
                                                                          child:
                                                                              Text(
                                                                            snapshot.data[2].toString(),
                                                                            style:
                                                                                TextStyle(
                                                                              color: Color.fromARGB(255, 45, 56, 75),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .symmetric(
                                                                          horizontal:
                                                                              28),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                        child:
                                                                            LinearProgressIndicator(
                                                                          value:
                                                                              snapshot.data[2] / globalD,
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            Color.fromARGB(
                                                                                255,
                                                                                254,
                                                                                123,
                                                                                88),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              } catch (err) {
                                                                return Text(
                                                                    'Please select a country first $err');
                                                              }
                                                              // return Text(snapshot.data.countryName.countryStats.toString());
                                                            } else if (snapshot
                                                                .hasError) {
                                                              return Text(
                                                                  "${snapshot.error}");
                                                            }

                                                            // By default, show a loading spinner.
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 40,
                                                                      bottom:
                                                                          30),
                                                              child: CircularProgressIndicator(
                                                                  valueColor: AlwaysStoppedAnimation<
                                                                          Color>(
                                                                      Colors.red[
                                                                          600])),
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  } catch (err) {
                                                    return Text(
                                                        'Please select a country first $err');
                                                  }
                                                  // return Text(snapshot.data.countryName.countryStats.toString());
                                                } else if (snapshot.hasError) {
                                                  return Text(
                                                      "${snapshot.error}");
                                                }

                                                // By default, show a loading spinner.
                                                return Container();
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              })),
                        ],
                      ),
                      GestureDetector(
                        onVerticalDragStart: (dragDetails) {
                          start = dragDetails;
                        },
                        onVerticalDragUpdate: (dragDetails) {
                          update = dragDetails;
                        },
                        onVerticalDragEnd: (endDetails) {
                          double dx = update.globalPosition.dx -
                              start.globalPosition.dx;
                          double dy = update.globalPosition.dy -
                              start.globalPosition.dy;
                          double velocity = endDetails.primaryVelocity;
                          if (dx < 0) dx = -dx;
                          if (dy < 0) dy = -dy;
                          if (velocity < 0) {
                          } else {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return ResultScreen(widget.country);
                            }));
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        : WaitingScreen(changeHasFetched);
  }
}
