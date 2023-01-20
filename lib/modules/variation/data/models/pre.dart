import '../../domain/entities/pre_entity.dart';

class Pre {
  String? timezone;
  int? start;
  int? end;
  int? gmtoffset;

  Pre({this.timezone, this.start, this.end, this.gmtoffset});

  Pre.fromJson(Map<String, dynamic> json) {
    timezone = json['timezone'];
    start = json['start'];
    end = json['end'];
    gmtoffset = json['gmtoffset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timezone'] = timezone;
    data['start'] = start;
    data['end'] = end;
    data['gmtoffset'] = gmtoffset;
    return data;
  }

  PreEntity toEntity() => PreEntity(
        end: end,
        gmtoffset: gmtoffset,
        start: start,
        timezone: timezone,
      );
}
