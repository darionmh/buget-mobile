import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: _AnalysisWidget(),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: _SimpleLineChart(
                _SimpleLineChart._createData(
                  [
                    new LinearSales(0, 5),
                    new LinearSales(1, 25),
                    new LinearSales(2, 100),
                    new LinearSales(3, 75),
                  ],
                  [
                    new LinearSales(0, 2),
                    new LinearSales(1, 12),
                    new LinearSales(2, 50),
                    new LinearSales(3, 32),
                  ],
                ),
                // Disable animations for image tests.
                animate: false,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 0,
              width: 0,
            ),
          )
        ],
      ),
    );
  }
}

// https://pub.dev/packages/pie_chart
class _PieChartWidget extends StatelessWidget {
  final Map<String, double> dataMap;

  _PieChartWidget(this.dataMap);

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: dataMap,
      chartType: ChartType.ring,
      chartRadius: MediaQuery.of(context).size.width / 3.0,
    );
  }
}

class _AnalysisWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Column(children: [
        Expanded(
          child: TabBarView(
            children: <Widget>[
              _PieChartWidget({
                'flutter': 1.5,
                'react': 2,
                'xamarin': 2,
                'ionic': 3,
                'ionic2': 3,
                'ionic3': 3,
                'ionic4': 3,
              }),
              _PieChartWidget({
                'flutter': 1.5,
                'react': 2,
                'xamarin': 2,
                'ionic': 3,
              }),
              _PieChartWidget({
                'flutter': 1.5,
                'react': 2,
                'xamarin': 2,
                'ionic': 3,
              }),
            ],
          ),
        ),
        TabBar(
          tabs: <Widget>[
            Text(
              'Monthly Breakdown',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Necessities vs Leisure',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Subscriptions',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ]),
      length: 3,
    );
  }
}

class _SimpleLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  _SimpleLineChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory _SimpleLineChart.withSampleData() {
    return new _SimpleLineChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  factory _SimpleLineChart.withData(List<LinearSales> data, List<LinearSales> data2) {
    return new _SimpleLineChart(
      _createData(data, data2),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(seriesList, animate: animate);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 5),
      new LinearSales(1, 25),
      new LinearSales(2, 100),
      new LinearSales(3, 75),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      ),
    ];
  }

  static List<charts.Series<LinearSales, int>> _createData(
    List<LinearSales> data,
    List<LinearSales> data2,
  ) {
    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      ),
      new charts.Series<LinearSales, int>(
        id: 'Sales2',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data2,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
