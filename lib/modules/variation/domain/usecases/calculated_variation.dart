import '../../../../core/extensions/format_date.dart';
import '../../../../core/extensions/format_money.dart';
import '../../data/models/chart.dart';
import '../entities/calculated_variation_entity.dart';

class CalculatedVariation {
  List<CalculatedVariationEntity> call(Chart chart) {
    final closes = chart.chart?.result?[0].indicators?.quote?[0].close ?? [];
    final dates = chart.chart?.result?[0].timestamp ?? [];

    double? valueD1;
    double valuePrimary = 1;
    String primaryDate = "";

    final result = closes.map((e) {
      int index = closes.indexOf(e);
      final timestamp = (dates[closes.indexOf(e)]);

      final dateActual = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: true).formatDateCompleted();

      if (index == 0) {
        valuePrimary = e;
        primaryDate = dateActual;
      }

      double valuePercentD1 = ((e - (valueD1 ?? 0)) / e) * 100;

      double valuePercentPrimary = ((e - valuePrimary) / e) * 100;

      final data = CalculatedVariationEntity(
        date: dateActual,
        value: e.formatMoney(),
        day: index + 1,
        variationD1: valueD1 != null ? "${valuePercentD1.toStringAsFixed(2)}%" : "0%",
        variationPrimaryDate: "${valuePercentPrimary.toStringAsFixed(2)}%",
        primaryDate: primaryDate,
      );
      valueD1 = e;
      return data;
    }).toList();

    return result;
  }
}
