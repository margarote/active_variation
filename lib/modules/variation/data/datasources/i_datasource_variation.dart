import '../models/chart.dart';

abstract class IDatasourceVariation {
  Future<Chart> searchSymbol(
    String symbol,
  );
}
