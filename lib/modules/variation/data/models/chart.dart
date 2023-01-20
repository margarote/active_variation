import '../../domain/entities/chart_entity.dart';
import 'chart_data.dart';

class Chart {
  ChartData? chart;

  Chart({this.chart});

  Chart.fromJson(Map<String, dynamic> json) {
    chart = json['chart'] != null ? ChartData.fromJson(json['chart']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (chart != null) {
      data['chart'] = chart!.toJson();
    }
    return data;
  }

  ChartEntity toEntity() => ChartEntity(
        chart: chart?.toEntity(),
      );
}
