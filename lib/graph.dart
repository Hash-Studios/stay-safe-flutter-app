import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CaseSeries {
  final String date;
  final double confirmed;
  final double recovered;
  final double deaths;

  CaseSeries(
      {@required this.date,
      @required this.confirmed,
      @required this.recovered,
      @required this.deaths});
}

class CaseChart extends StatelessWidget {
  final List dataChart;
  List<CaseSeries> data = [];

  CaseChart({@required this.dataChart}) {
    for (int i = 0; i < dataChart.length; i = i + 4) {
      data.add(CaseSeries(
          date: dataChart[i].toString(),
          confirmed: double.parse(dataChart[i + 1].toStringAsFixed(2)),
          recovered: double.parse(dataChart[i + 2].toStringAsFixed(2)),
          deaths: double.parse(dataChart[i + 3].toStringAsFixed(2))));
    }
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<CaseSeries, DateTime>> series = [
      charts.Series(
          id: "Cases",
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          data: data,
          domainFn: (CaseSeries series, _) => DateTime(
              int.parse(series.date.split("-")[0]),
              int.parse(series.date.split("-")[1]),
              int.parse(series.date.split("-")[2])),
          measureFn: (CaseSeries series, _) => series.confirmed),
      charts.Series(
          id: "Recovered Cases",
          colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
          data: data,
          domainFn: (CaseSeries series, _) => DateTime(
              int.parse(series.date.split("-")[0]),
              int.parse(series.date.split("-")[1]),
              int.parse(series.date.split("-")[2])),
          measureFn: (CaseSeries series, _) => series.recovered),
      charts.Series(
          id: "Deaths",
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
          data: data,
          domainFn: (CaseSeries series, _) => DateTime(
              int.parse(series.date.split("-")[0]),
              int.parse(series.date.split("-")[1]),
              int.parse(series.date.split("-")[2])),
          measureFn: (CaseSeries series, _) => series.deaths)
      // double.parse(series.date.split("-")[2])
    ];
    return Container(
      color: Colors.white,
      height: 200,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: new charts.TimeSeriesChart(
                  series,
                  animate: true,
                  animationDuration: Duration(milliseconds: 500),
                  defaultRenderer: new charts.LineRendererConfig(
                      includeArea: true, stacked: false),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
