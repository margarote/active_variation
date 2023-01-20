import '../../data/models/indicators.dart';
import 'adj_close_entity.dart';
import 'quote_entity.dart';

class IndicatorsEntity {
  List<QuoteEntity>? quote;
  List<AdjcloseEntity>? adjclose;

  IndicatorsEntity({this.quote, this.adjclose});

  Indicators toModel() => Indicators(
        adjclose: adjclose?.map((e) => e.toModel()).toList(),
        quote: quote?.map((e) => e.toModel()).toList(),
      );
}
