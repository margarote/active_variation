import 'package:intl/intl.dart';

extension FormatDate on DateTime? {
  String formatDate() {
    if (this != null) {
      return DateFormat("dd/MM").format(this!);
    }
    return "";
  }

  String formatDateCompleted() {
    if (this != null) {
      return DateFormat("dd/MM/yyyy").format(this!);
    }
    return "";
  }
}
