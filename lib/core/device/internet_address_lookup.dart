import 'dart:io';

import '../api/api_consts.dart';

class InternetAddressLookup {
  Future<List<InternetAddress>> lookup() => InternetAddress.lookup(ApiConsts.connectionDataCheckerAddress);
}
