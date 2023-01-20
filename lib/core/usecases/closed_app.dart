import 'dart:io';

import 'package:flutter/services.dart';

class ClosedApp {
  Future<void> call() async {
    if (Platform.isAndroid) {
      await SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    }
  }
}
