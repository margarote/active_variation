import 'package:intl/intl.dart';

extension FormatMoney on double? {
  String formatMoney() {
    return NumberFormat.simpleCurrency(locale: 'pt_BR', name: '').format(this).trim();
  }

  String formatMoneyCompact() {
    return NumberFormat.compact(
      locale: 'pt_BR',
    ).format(this).trim();
  }
}
