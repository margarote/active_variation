import '../../../../core/api/i_api_interceptor.dart';
import '../../../../core/device/i_network_info.dart';
import '../../../../core/error/network_failure.dart';
import '../../../../core/error/server_failure.dart';
import '../../../../core/usecases/get_base_url.dart';
import '../models/chart.dart';
import '../variation_endpoints.dart';
import 'i_datasource_variation.dart';

class DatasourceVariation implements IDatasourceVariation {
  final INetworkInfo networkInfo;
  final IApiInterceptor apiInterceptor;
  final GetBaseUrl getBaseUrl;

  DatasourceVariation(this.networkInfo, this.apiInterceptor, this.getBaseUrl);
  @override
  Future<Chart> searchSymbol(
    String symbol,
  ) async {
    final isConnected = await networkInfo.isConnected;
    if (!isConnected) {
      throw NetworkFailure();
    }
    String url = getBaseUrl();

    url += (VariationEndpoints.url + symbol);

    final DateTime now = DateTime.now();

    final result = await apiInterceptor.get(
      url,
      queryParams: {
        "symbol": symbol,
        "period1": "1649818800", // 30 dias
        "period2": now.millisecondsSinceEpoch,
        "useYfid": true,
        "interval": "1d",
      },
    );

    if (result.statusCode != 200) {
      throw ServerFailure();
    }

    final data = result.data;

    final chart = Chart.fromJson(data);

    return chart;
  }
}
