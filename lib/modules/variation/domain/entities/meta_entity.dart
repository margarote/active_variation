import '../../data/models/meta.dart';
import 'current_trading_period_entity.dart';

class MetaEntity {
  String? currency;
  String? symbol;
  String? exchangeName;
  String? instrumentType;
  int? firstTradeDate;
  int? regularMarketTime;
  int? gmtoffset;
  String? timezone;
  String? exchangeTimezoneName;
  double? regularMarketPrice;
  double? chartPreviousClose;
  int? priceHint;
  CurrentTradingPeriodEntity? currentTradingPeriod;
  String? dataGranularity;
  String? range;
  List<String>? validRanges;

  MetaEntity(
      {this.currency,
      this.symbol,
      this.exchangeName,
      this.instrumentType,
      this.firstTradeDate,
      this.regularMarketTime,
      this.gmtoffset,
      this.timezone,
      this.exchangeTimezoneName,
      this.regularMarketPrice,
      this.chartPreviousClose,
      this.priceHint,
      this.currentTradingPeriod,
      this.dataGranularity,
      this.range,
      this.validRanges});

  Meta toModel() => Meta(
        chartPreviousClose: chartPreviousClose,
        currency: currency,
        currentTradingPeriod: currentTradingPeriod?.toModel(),
        dataGranularity: dataGranularity,
        exchangeName: exchangeName,
        exchangeTimezoneName: exchangeTimezoneName,
        firstTradeDate: firstTradeDate,
        gmtoffset: gmtoffset,
        instrumentType: instrumentType,
        priceHint: priceHint,
        range: range,
        regularMarketPrice: regularMarketPrice,
        regularMarketTime: regularMarketTime,
        symbol: symbol,
        timezone: timezone,
        validRanges: validRanges,
      );
}
