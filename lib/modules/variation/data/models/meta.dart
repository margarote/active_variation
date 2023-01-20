import '../../domain/entities/meta_entity.dart';
import 'current_trading_period.dart';

class Meta {
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
  CurrentTradingPeriod? currentTradingPeriod;
  String? dataGranularity;
  String? range;
  List<String>? validRanges;

  Meta(
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

  Meta.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    symbol = json['symbol'];
    exchangeName = json['exchangeName'];
    instrumentType = json['instrumentType'];
    firstTradeDate = json['firstTradeDate'];
    regularMarketTime = json['regularMarketTime'];
    gmtoffset = json['gmtoffset'];
    timezone = json['timezone'];
    exchangeTimezoneName = json['exchangeTimezoneName'];
    regularMarketPrice = json['regularMarketPrice'];
    chartPreviousClose = json['chartPreviousClose'];
    priceHint = json['priceHint'];
    currentTradingPeriod =
        json['currentTradingPeriod'] != null ? CurrentTradingPeriod.fromJson(json['currentTradingPeriod']) : null;
    dataGranularity = json['dataGranularity'];
    range = json['range'];
    validRanges = json['validRanges'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currency'] = currency;
    data['symbol'] = symbol;
    data['exchangeName'] = exchangeName;
    data['instrumentType'] = instrumentType;
    data['firstTradeDate'] = firstTradeDate;
    data['regularMarketTime'] = regularMarketTime;
    data['gmtoffset'] = gmtoffset;
    data['timezone'] = timezone;
    data['exchangeTimezoneName'] = exchangeTimezoneName;
    data['regularMarketPrice'] = regularMarketPrice;
    data['chartPreviousClose'] = chartPreviousClose;
    data['priceHint'] = priceHint;
    if (currentTradingPeriod != null) {
      data['currentTradingPeriod'] = currentTradingPeriod!.toJson();
    }
    data['dataGranularity'] = dataGranularity;
    data['range'] = range;
    data['validRanges'] = validRanges;
    return data;
  }

  MetaEntity toEntity() => MetaEntity(
        chartPreviousClose: chartPreviousClose,
        currency: currency,
        currentTradingPeriod: currentTradingPeriod?.toEntity(),
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
