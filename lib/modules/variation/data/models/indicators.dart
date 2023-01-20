import '../../domain/entities/indicators_entity.dart';
import 'adj_close.dart';
import 'quote.dart';

class Indicators {
  List<Quote>? quote;
  List<Adjclose>? adjclose;

  Indicators({this.quote, this.adjclose});

  Indicators.fromJson(Map<String, dynamic> json) {
    if (json['quote'] != null) {
      quote = <Quote>[];
      json['quote'].forEach((v) {
        quote!.add(Quote.fromJson(v));
      });
    }
    if (json['adjclose'] != null) {
      adjclose = <Adjclose>[];
      json['adjclose'].forEach((v) {
        adjclose!.add(Adjclose.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (quote != null) {
      data['quote'] = quote!.map((v) => v.toJson()).toList();
    }
    if (adjclose != null) {
      data['adjclose'] = adjclose!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  IndicatorsEntity toEntity() => IndicatorsEntity(
        adjclose: adjclose?.map((e) => e.toEntity()).toList(),
        quote: quote?.map((e) => e.toEntity()).toList(),
      );
}
