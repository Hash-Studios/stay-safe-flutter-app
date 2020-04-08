import './blinker.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:slimy_card/slimy_card.dart';

class Country {
  final List countryStats;

  Country({this.countryStats});

  factory Country.fromJson(List<dynamic> json) {
    return Country(countryStats: json);
  }
}

class Countries {
  static List countriesData = [];

  Country countryName;

  Countries({this.countryName});

  factory Countries.fromJson(Map<String, dynamic> json, int index) {
    List countryNames = [
      'Afghanistan',
      'Albania',
      'Algeria',
      'Andorra',
      'Angola',
      'Antigua and Barbuda',
      'Argentina',
      'Armenia',
      'Australia',
      'Austria',
      'Azerbaijan',
      'Bahamas',
      'Bahrain',
      'Bangladesh',
      'Barbados',
      'Belarus',
      'Belgium',
      'Benin',
      'Bhutan',
      'Bolivia',
      'Bosnia and Herzegovina',
      'Brazil',
      'Brunei',
      'Bulgaria',
      'Burkina Faso',
      'Cabo Verde',
      'Cambodia',
      'Cameroon',
      'Canada',
      'Central African Republic',
      'Chad',
      'Chile',
      'China',
      'Colombia',
      'Congo (Brazzaville)',
      'Congo (Kinshasa)',
      'Costa Rica',
      "Cote d'Ivoire",
      'Croatia',
      'Diamond Princess',
      'Cuba',
      'Cyprus',
      'Czechia',
      'Denmark',
      'Djibouti',
      'Dominican Republic',
      'Ecuador',
      'Egypt',
      'El Salvador',
      'Equatorial Guinea',
      'Eritrea',
      'Estonia',
      'Eswatini',
      'Ethiopia',
      'Fiji',
      'Finland',
      'France',
      'Gabon',
      'Gambia',
      'Georgia',
      'Germany',
      'Ghana',
      'Greece',
      'Guatemala',
      'Guinea',
      'Guyana',
      'Haiti',
      'Holy See',
      'Honduras',
      'Hungary',
      'Iceland',
      'India',
      'Indonesia',
      'Iran',
      'Iraq',
      'Ireland',
      'Israel',
      'Italy',
      'Jamaica',
      'Japan',
      'Jordan',
      'Kazakhstan',
      'Kenya',
      'South Korea',
      'Kuwait',
      'Kyrgyzstan',
      'Latvia',
      'Lebanon',
      'Liberia',
      'Liechtenstein',
      'Lithuania',
      'Luxembourg',
      'Madagascar',
      'Malaysia',
      'Maldives',
      'Malta',
      'Mauritania',
      'Mauritius',
      'Mexico',
      'Moldova',
      'Monaco',
      'Mongolia',
      'Montenegro',
      'Morocco',
      'Namibia',
      'Nepal',
      'Netherlands',
      'New Zealand',
      'Nicaragua',
      'Niger',
      'Nigeria',
      'North Macedonia',
      'Norway',
      'Oman',
      'Pakistan',
      'Panama',
      'Papua New Guinea',
      'Paraguay',
      'Peru',
      'Philippines',
      'Poland',
      'Portugal',
      'Qatar',
      'Romania',
      'Russia',
      'Rwanda',
      'Saint Lucia',
      'Saint Vincent and the Grenadines',
      'San Marino',
      'Saudi Arabia',
      'Senegal',
      'Serbia',
      'Seychelles',
      'Singapore',
      'Slovakia',
      'Slovenia',
      'Somalia',
      'South Africa',
      'Spain',
      'Sri Lanka',
      'Sudan',
      'Suriname',
      'Sweden',
      'Switzerland',
      'Taiwan*',
      'Tanzania',
      'Thailand',
      'Togo',
      'Trinidad and Tobago',
      'Tunisia',
      'Turkey',
      'Uganda',
      'Ukraine',
      'United Arab Emirates',
      'United Kingdom',
      'Uruguay',
      'US',
      'Uzbekistan',
      'Venezuela',
      'Vietnam',
      'Zambia',
      'Zimbabwe',
      'Dominica',
      'Grenada',
      'Mozambique',
      'Syria',
      'Timor-Leste',
      'Belize',
      'Laos',
      'Libya',
      'West Bank and Gaza',
      'Guinea-Bissau',
      'Mali',
      'Saint Kitts and Nevis',
      'Kosovo',
      'Burma',
      'MS Zaandam',
      'Botswana',
      'Burundi',
      'Sierra Leone',
      'Malawi',
      'South Sudan',
      'Western Sahara',
      'Sao Tome and Principe'
    ];

    return Countries(countryName: Country.fromJson(json[countryNames[index]]));
  }

  List get getCountriesData {
    return countriesData;
  }
}

Future<Countries> fetchCountries(String countryN) async {
  List countryNames = [
    'Afghanistan',
    'Albania',
    'Algeria',
    'Andorra',
    'Angola',
    'Antigua and Barbuda',
    'Argentina',
    'Armenia',
    'Australia',
    'Austria',
    'Azerbaijan',
    'Bahamas',
    'Bahrain',
    'Bangladesh',
    'Barbados',
    'Belarus',
    'Belgium',
    'Benin',
    'Bhutan',
    'Bolivia',
    'Bosnia and Herzegovina',
    'Brazil',
    'Brunei',
    'Bulgaria',
    'Burkina Faso',
    'Cabo Verde',
    'Cambodia',
    'Cameroon',
    'Canada',
    'Central African Republic',
    'Chad',
    'Chile',
    'China',
    'Colombia',
    'Congo (Brazzaville)',
    'Congo (Kinshasa)',
    'Costa Rica',
    "Cote d'Ivoire",
    'Croatia',
    'Diamond Princess',
    'Cuba',
    'Cyprus',
    'Czechia',
    'Denmark',
    'Djibouti',
    'Dominican Republic',
    'Ecuador',
    'Egypt',
    'El Salvador',
    'Equatorial Guinea',
    'Eritrea',
    'Estonia',
    'Eswatini',
    'Ethiopia',
    'Fiji',
    'Finland',
    'France',
    'Gabon',
    'Gambia',
    'Georgia',
    'Germany',
    'Ghana',
    'Greece',
    'Guatemala',
    'Guinea',
    'Guyana',
    'Haiti',
    'Holy See',
    'Honduras',
    'Hungary',
    'Iceland',
    'India',
    'Indonesia',
    'Iran',
    'Iraq',
    'Ireland',
    'Israel',
    'Italy',
    'Jamaica',
    'Japan',
    'Jordan',
    'Kazakhstan',
    'Kenya',
    'South Korea',
    'Kuwait',
    'Kyrgyzstan',
    'Latvia',
    'Lebanon',
    'Liberia',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Madagascar',
    'Malaysia',
    'Maldives',
    'Malta',
    'Mauritania',
    'Mauritius',
    'Mexico',
    'Moldova',
    'Monaco',
    'Mongolia',
    'Montenegro',
    'Morocco',
    'Namibia',
    'Nepal',
    'Netherlands',
    'New Zealand',
    'Nicaragua',
    'Niger',
    'Nigeria',
    'North Macedonia',
    'Norway',
    'Oman',
    'Pakistan',
    'Panama',
    'Papua New Guinea',
    'Paraguay',
    'Peru',
    'Philippines',
    'Poland',
    'Portugal',
    'Qatar',
    'Romania',
    'Russia',
    'Rwanda',
    'Saint Lucia',
    'Saint Vincent and the Grenadines',
    'San Marino',
    'Saudi Arabia',
    'Senegal',
    'Serbia',
    'Seychelles',
    'Singapore',
    'Slovakia',
    'Slovenia',
    'Somalia',
    'South Africa',
    'Spain',
    'Sri Lanka',
    'Sudan',
    'Suriname',
    'Sweden',
    'Switzerland',
    'Taiwan*',
    'Tanzania',
    'Thailand',
    'Togo',
    'Trinidad and Tobago',
    'Tunisia',
    'Turkey',
    'Uganda',
    'Ukraine',
    'United Arab Emirates',
    'United Kingdom',
    'Uruguay',
    'US',
    'Uzbekistan',
    'Venezuela',
    'Vietnam',
    'Zambia',
    'Zimbabwe',
    'Dominica',
    'Grenada',
    'Mozambique',
    'Syria',
    'Timor-Leste',
    'Belize',
    'Laos',
    'Libya',
    'West Bank and Gaza',
    'Guinea-Bissau',
    'Mali',
    'Saint Kitts and Nevis',
    'Kosovo',
    'Burma',
    'MS Zaandam',
    'Botswana',
    'Burundi',
    'Sierra Leone',
    'Malawi',
    'South Sudan',
    'Western Sahara',
    'Sao Tome and Principe'
  ];
  final response =
      await http.get('https://pomber.github.io/covid19/timeseries.json');

  if (response.statusCode == 200) {
    return Countries.fromJson(
        json.decode(response.body), countryNames.indexOf(countryN));
  } else {
    throw Exception('Failed to load album');
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: "Gothic",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List countryNames = [
    'Afghanistan',
    'Albania',
    'Algeria',
    'Andorra',
    'Angola',
    'Antigua and Barbuda',
    'Argentina',
    'Armenia',
    'Australia',
    'Austria',
    'Azerbaijan',
    'Bahamas',
    'Bahrain',
    'Bangladesh',
    'Barbados',
    'Belarus',
    'Belgium',
    'Benin',
    'Bhutan',
    'Bolivia',
    'Bosnia and Herzegovina',
    'Brazil',
    'Brunei',
    'Bulgaria',
    'Burkina Faso',
    'Cabo Verde',
    'Cambodia',
    'Cameroon',
    'Canada',
    'Central African Republic',
    'Chad',
    'Chile',
    'China',
    'Colombia',
    'Congo (Brazzaville)',
    'Congo (Kinshasa)',
    'Costa Rica',
    "Cote d'Ivoire",
    'Croatia',
    'Diamond Princess',
    'Cuba',
    'Cyprus',
    'Czechia',
    'Denmark',
    'Djibouti',
    'Dominican Republic',
    'Ecuador',
    'Egypt',
    'El Salvador',
    'Equatorial Guinea',
    'Eritrea',
    'Estonia',
    'Eswatini',
    'Ethiopia',
    'Fiji',
    'Finland',
    'France',
    'Gabon',
    'Gambia',
    'Georgia',
    'Germany',
    'Ghana',
    'Greece',
    'Guatemala',
    'Guinea',
    'Guyana',
    'Haiti',
    'Holy See',
    'Honduras',
    'Hungary',
    'Iceland',
    'India',
    'Indonesia',
    'Iran',
    'Iraq',
    'Ireland',
    'Israel',
    'Italy',
    'Jamaica',
    'Japan',
    'Jordan',
    'Kazakhstan',
    'Kenya',
    'South Korea',
    'Kuwait',
    'Kyrgyzstan',
    'Latvia',
    'Lebanon',
    'Liberia',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Madagascar',
    'Malaysia',
    'Maldives',
    'Malta',
    'Mauritania',
    'Mauritius',
    'Mexico',
    'Moldova',
    'Monaco',
    'Mongolia',
    'Montenegro',
    'Morocco',
    'Namibia',
    'Nepal',
    'Netherlands',
    'New Zealand',
    'Nicaragua',
    'Niger',
    'Nigeria',
    'North Macedonia',
    'Norway',
    'Oman',
    'Pakistan',
    'Panama',
    'Papua New Guinea',
    'Paraguay',
    'Peru',
    'Philippines',
    'Poland',
    'Portugal',
    'Qatar',
    'Romania',
    'Russia',
    'Rwanda',
    'Saint Lucia',
    'Saint Vincent and the Grenadines',
    'San Marino',
    'Saudi Arabia',
    'Senegal',
    'Serbia',
    'Seychelles',
    'Singapore',
    'Slovakia',
    'Slovenia',
    'Somalia',
    'South Africa',
    'Spain',
    'Sri Lanka',
    'Sudan',
    'Suriname',
    'Sweden',
    'Switzerland',
    'Taiwan*',
    'Tanzania',
    'Thailand',
    'Togo',
    'Trinidad and Tobago',
    'Tunisia',
    'Turkey',
    'Uganda',
    'Ukraine',
    'United Arab Emirates',
    'United Kingdom',
    'Uruguay',
    'US',
    'Uzbekistan',
    'Venezuela',
    'Vietnam',
    'Zambia',
    'Zimbabwe',
    'Dominica',
    'Grenada',
    'Mozambique',
    'Syria',
    'Timor-Leste',
    'Belize',
    'Laos',
    'Libya',
    'West Bank and Gaza',
    'Guinea-Bissau',
    'Mali',
    'Saint Kitts and Nevis',
    'Kosovo',
    'Burma',
    'MS Zaandam',
    'Botswana',
    'Burundi',
    'Sierra Leone',
    'Malawi',
    'South Sudan',
    'Western Sahara',
    'Sao Tome and Principe'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 247, 247, 247),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 9),
                    child: MyBlinkingButton(
                      child: Text(
                        'Select Country',
                        style: TextStyle(
                            fontFamily: "Gothic",
                            color: Color.fromARGB(
                              255,
                              40,
                              40,
                              40,
                            )),
                      ),
                    ),
                  )),
              Expanded(
                flex: 15,
                child: Container(
                  child: ListView.builder(
                      itemCount: countryNames.length,
                      // separatorBuilder: (context, index) {
                      //   return Divider(
                      //     height: 1,
                      //     thickness: 1,
                      //     color: Color.fromARGB(255, 255, 97, 115),
                      //   );
                      // },
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 60,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: Color.fromARGB(255, 255, 97, 115),
                            margin: EdgeInsets.only(
                                left: 8, right: 8, top: 3, bottom: 3),
                            elevation: 0,
                            child: MaterialButton(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 5),
                                child: Text(
                                  countryNames[index],
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Color.fromARGB(
                                        255,
                                        40,
                                        40,
                                        40,
                                      )),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return ResultScreen(countryNames[index]);
                                  }));
                                });
                              },
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResultScreen extends StatefulWidget {
  String country;
  ResultScreen(this.country);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  DragStartDetails start;
  DragUpdateDetails update;
  Future<Countries> futureCountries;
  List listAllValue;
  List allValue;
  Map<String, dynamic> dayValue;

  @override
  void initState() {
    super.initState();
    allValue = [];
    listAllValue = [];
    futureCountries = fetchCountries(widget.country);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Center(
                              child: MyBlinkingButton(
                                  child: Text('Swipe down to refresh'))),
                        )),
                    Expanded(
                      flex: 20,
                      child: Container(
                        width: 370,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 100, left: 20, right: 20),
                          child: ListView(
                            children: <Widget>[
                              SlimyCard(
                                color: Color.fromARGB(255, 255, 97, 115),
                                borderRadius: 20,
                                topCardWidget: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        '${widget.country}',
                                        style: TextStyle(
                                            fontSize: 36,
                                            color: Color.fromARGB(
                                                255, 247, 247, 247)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        'Total Cases',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color.fromARGB(
                                                255, 200, 200, 200)),
                                      ),
                                    ),
                                    FutureBuilder<Countries>(
                                      future: futureCountries,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          try {
                                            listAllValue.add(snapshot
                                                .data.countryName.countryStats);
                                            allValue = (listAllValue[0]);
                                            dayValue =
                                                (allValue[allValue.length - 1]);

                                            // print(allValue.length);
                                            return Column(
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 40, bottom: 30),
                                                  child: Text(
                                                    dayValue['confirmed']
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontFamily: "Gothic",
                                                        fontSize: 48,
                                                        color: Color.fromARGB(
                                                          255,
                                                          40,
                                                          40,
                                                          40,
                                                        )),
                                                  ),
                                                ),
                                              ],
                                            );
                                          } catch (err) {
                                            return Text(
                                                'Please select a country first $err');
                                          }
                                          // return Text(snapshot.data.countryName.countryStats.toString());
                                        } else if (snapshot.hasError) {
                                          return Text("${snapshot.error}");
                                        }

                                        // By default, show a loading spinner.
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              top: 40, bottom: 30),
                                          child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Colors.red[600])),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                bottomCardHeight: 240,
                                bottomCardWidget: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 140,
                                        child: Card(
                                          color: Color.fromARGB(
                                              255, 194, 253, 171),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Column(
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Text(
                                                  'Recovered',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Color.fromARGB(
                                                          255, 100, 100, 100)),
                                                ),
                                              ),
                                              FutureBuilder<Countries>(
                                                future: futureCountries,
                                                builder: (context, snapshot) {
                                                  if (snapshot.hasData) {
                                                    try {
                                                      listAllValue.add(snapshot
                                                          .data
                                                          .countryName
                                                          .countryStats);
                                                      allValue =
                                                          (listAllValue[0]);
                                                      dayValue = (allValue[
                                                          allValue.length - 1]);

                                                      // print(allValue.length);
                                                      return Column(
                                                        children: <Widget>[
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 40,
                                                                    bottom: 30),
                                                            child: Text(
                                                              dayValue[
                                                                      'recovered']
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Gothic",
                                                                  fontSize: 40,
                                                                  color: Color
                                                                      .fromARGB(
                                                                    255,
                                                                    40,
                                                                    40,
                                                                    40,
                                                                  )),
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
                                                        const EdgeInsets.only(
                                                            top: 40,
                                                            bottom: 30),
                                                    child: CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                    Color>(
                                                                Colors
                                                                    .red[600])),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 140,
                                        child: Card(
                                          color: Color.fromARGB(
                                              255, 255, 196, 190),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Column(
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Text(
                                                  'Deaths',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Color.fromARGB(
                                                          255, 100, 100, 100)),
                                                ),
                                              ),
                                              FutureBuilder<Countries>(
                                                future: futureCountries,
                                                builder: (context, snapshot) {
                                                  if (snapshot.hasData) {
                                                    try {
                                                      listAllValue.add(snapshot
                                                          .data
                                                          .countryName
                                                          .countryStats);
                                                      allValue =
                                                          (listAllValue[0]);
                                                      dayValue = (allValue[
                                                          allValue.length - 1]);

                                                      // print(allValue.length);
                                                      return Column(
                                                        children: <Widget>[
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 40,
                                                                    bottom: 30),
                                                            child: Text(
                                                              dayValue['deaths']
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Gothic",
                                                                  fontSize: 40,
                                                                  color: Color
                                                                      .fromARGB(
                                                                    255,
                                                                    40,
                                                                    40,
                                                                    40,
                                                                  )),
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
                                                        const EdgeInsets.only(
                                                            top: 40,
                                                            bottom: 30),
                                                    child: CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                    Color>(
                                                                Colors
                                                                    .red[600])),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
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
                    double dx =
                        update.globalPosition.dx - start.globalPosition.dx;
                    double dy =
                        update.globalPosition.dy - start.globalPosition.dy;
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
    );
  }
}
