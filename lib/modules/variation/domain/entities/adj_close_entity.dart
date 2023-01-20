import '../../data/models/adj_close.dart';

class AdjcloseEntity {
  List<double>? adjclose;

  AdjcloseEntity({this.adjclose});

  Adjclose toModel() => Adjclose(
        adjclose: adjclose,
      );
}
