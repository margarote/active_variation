import '../../data/models/quote.dart';

class QuoteEntity {
  List<double>? high;
  List<double>? close;
  List<double>? low;
  List<int>? volume;
  List<double>? open;

  QuoteEntity({this.high, this.close, this.low, this.volume, this.open});

  Quote toModel() => Quote(
        close: close,
        high: high,
        low: low,
        open: open,
        volume: volume,
      );
}
