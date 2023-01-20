import '../../data/models/chart_data.dart';
import 'result_chart_entity.dart';

class ChartDataEntity {
  List<ResultChartEntity>? result;

  ChartDataEntity({this.result});

  ChartData toModel() => ChartData(
        result: result?.map((e) => e.toModel()).toList(),
      );
}
