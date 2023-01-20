import '../../data/models/result.dart';
import 'indicators_entity.dart';
import 'meta_entity.dart';

class ResultChartEntity {
  MetaEntity? meta;
  List<int>? timestamp;
  IndicatorsEntity? indicators;

  ResultChartEntity({this.meta, this.timestamp, this.indicators});

  Result toModel() => Result(
        indicators: indicators?.toModel(),
        meta: meta?.toModel(),
        timestamp: timestamp,
      );
}
