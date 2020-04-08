import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
        primarySwatch: Colors.blue,
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
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromARGB(255, 136, 140, 138),
              Color.fromARGB(255, 209, 203, 204)
            ])),
        child: Column(
          children: <Widget>[
            Text('Select Country'),
            ListView.builder(
                itemCount: countryNames.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(countryNames[index]),
                    onTap: () {
                      print(countryNames[index]);
                      setState(() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ResultScreen(countryNames[index]);
                        }));
                      });
                    },
                  );
                }),
          ],
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
      appBar: AppBar(
        title: Text('Fetch Data Example'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            FutureBuilder<Countries>(
              future: futureCountries,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  try {
                    listAllValue.add(snapshot.data.countryName.countryStats);
                    allValue = (listAllValue[0]);
                    dayValue = (allValue[allValue.length - 1]);

                    print(allValue.length);
                    return Column(
                      children: <Widget>[
                        Text(dayValue['confirmed'].toString()),
                      ],
                    );
                  } catch (err) {
                    return Text('Please select a country first $err');
                  }
                  // return Text(snapshot.data.countryName.countryStats.toString());
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
