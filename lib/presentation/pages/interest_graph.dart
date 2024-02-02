import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../domain/entities/article.dart';

class InterestsData {
  InterestsData(this.year, this.sales);

  final String year;
  final double sales;
}

class InterestsGraph extends StatelessWidget {
  List<InterestsData> dataSales = [];
  List<Article> articles;
  InterestsGraph({super.key, required this.articles});
  var data = Map<String, int>();
  @override
  Widget build(BuildContext context) {
    var keyvals = Map<dynamic, dynamic>();
    var groupByDate =
        groupBy(articles, (obj) => obj.publishedAt.substring(0, 10));
    groupByDate.forEach((date, list) {
      // Header

      // Group
      list.forEach((listItem) {
        // List item
        print('${listItem.publishedAt}, ${listItem.title}');
      });
      data[date] = list.length;
      dataSales.add(InterestsData(date, list.length.toDouble()));
      // day section divider
      print('\n');
    });
    print('----------------------');
    print(data);
    return RotatedBox(
      quarterTurns: 3,
      child: SfCartesianChart(
          // Initialize category axis
          primaryXAxis: CategoryAxis(),
          series: <BarSeries<InterestsData, String>>[
            BarSeries<InterestsData, String>(
                // Bind data source
                dataSource: dataSales,
                xValueMapper: (InterestsData sales, _) => sales.year,
                yValueMapper: (InterestsData sales, _) => sales.sales)
          ]),
    );
  }
}
