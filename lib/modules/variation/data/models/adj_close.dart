import '../../domain/entities/adj_close_entity.dart';

class Adjclose {
  List<double>? adjclose;

  Adjclose({this.adjclose});

  Adjclose.fromJson(Map<String, dynamic> json) {
    adjclose = json['adjclose'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adjclose'] = adjclose;
    return data;
  }

  AdjcloseEntity toEntity() => AdjcloseEntity(
        adjclose: adjclose,
      );
}
