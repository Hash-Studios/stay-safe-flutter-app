import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';
import './graph.dart';

Future<List> fetchGlobalTotal() async {
  List countryValue = [];
  List countryValueC = [];
  List countryValueR = [];
  List countryValueD = [];
  var sumC = 0;
  var sumR = 0;
  var sumD = 0;
  List singleCData = [];
  Map<String, dynamic> doubleCData = {};
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
    'Korea, South',
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
    var fetchData = jsonDecode(response.body);
    for (int i = 0; i < countryNames.length; i++) {
      singleCData = fetchData[countryNames[i]];
      doubleCData = singleCData[singleCData.length - 1];
      for (int p = 0; p < doubleCData.length; p++) {
        countryValueC.add(doubleCData["confirmed"]);
        countryValueR.add(doubleCData["recovered"]);
        countryValueD.add(doubleCData["deaths"]);
      }
    }
    countryValueC.forEach((e) => sumC += e);
    countryValueR.forEach((e) => sumR += e);
    countryValueD.forEach((e) => sumD += e);
    countryValue.add((sumC / 4).round());
    countryValue.add((sumR / 4).round());
    countryValue.add((sumD / 4).round());
    return countryValue;
  } else {
    throw Exception('Failed to load global data');
  }
}

Future<List> fetchSingleCountry(String countryName) async {
  List countryValue = [];
  List countryValueC = [];
  List countryValueR = [];
  List countryValueD = [];
  var sumC = 0;
  var sumR = 0;
  var sumD = 0;
  List singleCData = [];
  Map<String, dynamic> doubleCData = {};

  final response =
      await http.get('https://pomber.github.io/covid19/timeseries.json');

  if (response.statusCode == 200) {
    var fetchData = jsonDecode(response.body);
    singleCData = fetchData[countryName];
    doubleCData = singleCData[singleCData.length - 1];
    for (int p = 0; p < doubleCData.length; p++) {
      countryValueC.add(doubleCData["confirmed"]);
      countryValueR.add(doubleCData["recovered"]);
      countryValueD.add(doubleCData["deaths"]);
    }

    countryValueC.forEach((e) => sumC += e);
    countryValueR.forEach((e) => sumR += e);
    countryValueD.forEach((e) => sumD += e);
    countryValue.add((sumC / 4).round());
    countryValue.add((sumR / 4).round());
    countryValue.add((sumD / 4).round());
    return countryValue;
  } else {
    throw Exception('Failed to load $countryName data');
  }
}

Future<List> fetchSingleCountryGraph(String countryName) async {
  List<dynamic> countryValue = [];
  // List countryValueC = [];
  // List countryValueR = [];
  // List countryValueD = [];
  // var sumC = 0;
  // var sumR = 0;
  // var sumD = 0;
  List singleCData = [];
  Map<String, dynamic> doubleCData = {};

  final response =
      await http.get('https://pomber.github.io/covid19/timeseries.json');

  if (response.statusCode == 200) {
    var fetchData = jsonDecode(response.body);
    singleCData = fetchData[countryName];
    for (int j = 30; j < singleCData.length; j++) {
      doubleCData = singleCData[j];

      //   countryValueC.add(doubleCData["confirmed"]);
      //   countryValueR.add(doubleCData["recovered"]);
      //   countryValueD.add(doubleCData["deaths"]);
      countryValue.add(doubleCData["date"]);
      countryValue
          .add(double.parse(doubleCData["confirmed"].toStringAsFixed(2)));
      countryValue
          .add(double.parse(doubleCData["recovered"].toStringAsFixed(2)));
      countryValue
          .add(double.parse(doubleCData["deaths"].toStringAsFixed(2)));
    }

    // countryValueC.forEach((e) => sumC += e);
    // countryValueR.forEach((e) => sumR += e);
    // countryValueD.forEach((e) => sumD += e);
    // countryValue.add((sumC / 4).round());
    // countryValue.add((sumR / 4).round());
    // countryValue.add((sumD / 4).round());
    return countryValue;
  } else {
    throw Exception('Failed to load $countryName data');
  }
}
