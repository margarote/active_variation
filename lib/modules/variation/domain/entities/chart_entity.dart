import '../../data/models/chart.dart';
import 'chart_data_entity.dart';

class ChartEntity {
  ChartDataEntity? chart;

  ChartEntity({this.chart});

  Chart toModel() => Chart(
        chart: chart?.toModel(),
      );
}
