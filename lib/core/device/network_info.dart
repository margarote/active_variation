import 'i_network_info.dart';
import 'internet_address_lookup.dart';

class NetworkInfo implements INetworkInfo {
  InternetAddressLookup internetAddressLookup;
  NetworkInfo(this.internetAddressLookup);

  @override
  Future<bool> get isConnected async {
    try {
      final result = await internetAddressLookup.lookup();
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
