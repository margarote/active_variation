import '../../domain/entities/chart_data_entity.dart';

import 'result.dart';

class ChartData {
  List<Result>? result;

  ChartData({this.result});

  ChartData.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  ChartDataEntity toEntity() => ChartDataEntity(
        result: result?.map((e) => e.toEntity()).toList(),
      );
}
