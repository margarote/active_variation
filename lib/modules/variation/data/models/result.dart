import '../../domain/entities/result_chart_entity.dart';
import 'indicators.dart';
import 'meta.dart';

class Result {
  Meta? meta;
  List<int>? timestamp;
  Indicators? indicators;

  Result({this.meta, this.timestamp, this.indicators});

  Result.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    timestamp = json['timestamp'].cast<int>();

    timestamp = timestamp?.getRange((timestamp?.length ?? 0) - 30, (timestamp?.length ?? 0)).toList();
    indicators = json['indicators'] != null ? Indicators.fromJson(json['indicators']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['timestamp'] = timestamp;
    if (indicators != null) {
      data['indicators'] = indicators!.toJson();
    }
    return data;
  }

  ResultChartEntity toEntity() => ResultChartEntity(
        indicators: indicators?.toEntity(),
        meta: meta?.toEntity(),
        timestamp: timestamp,
      );
}
