import '../../domain/entities/quote_entity.dart';

class Quote {
  List<double>? high;
  List<double>? close;
  List<double>? low;
  List<int>? volume;
  List<double>? open;

  Quote({this.high, this.close, this.low, this.volume, this.open});

  Quote.fromJson(Map<String, dynamic> json) {
    high = json['high'].cast<double>();
    close = json['close'].cast<double>();
    low = json['low'].cast<double>();
    volume = json['volume'].cast<int>();
    open = json['open'].cast<double>();

    int quantity = 30;

    final highLast = (high?.length ?? 0);
    final closeLast = (close?.length ?? 0);
    final lowLast = (low?.length ?? 0);
    final volumeLast = (volume?.length ?? 0);
    final openLast = (open?.length ?? 0);

    high = high?.getRange(highLast - quantity, highLast).toList();
    close = close?.getRange(highLast - quantity, closeLast).toList();
    low = low?.getRange(highLast - quantity, lowLast).toList();
    volume = volume?.getRange(highLast - quantity, volumeLast).toList();
    open = open?.getRange(highLast - quantity, openLast).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['high'] = high;
    data['close'] = close;
    data['low'] = low;
    data['volume'] = volume;
    data['open'] = open;
    return data;
  }

  QuoteEntity toEntity() => QuoteEntity(
        close: close,
        high: high,
        low: low,
        open: open,
        volume: volume,
      );
}
