import '../../data/models/pre.dart';

class PreEntity {
  String? timezone;
  int? start;
  int? end;
  int? gmtoffset;

  PreEntity({this.timezone, this.start, this.end, this.gmtoffset});

  Pre toModel() => Pre(
        end: end,
        gmtoffset: gmtoffset,
        start: start,
        timezone: timezone,
      );
}
