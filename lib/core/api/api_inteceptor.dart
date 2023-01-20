import 'package:dio/dio.dart';

import 'data/response_data.dart';
import 'i_api_interceptor.dart';

class ApiInterceptor implements IApiInterceptor {
  final Dio _dio;
  late Options _options;

  ApiInterceptor(this._dio) {
    _options = Options(
      receiveDataWhenStatusError: true,
      validateStatus: (a) {
        return true;
      },
    );
  }

  @override
  Future<ResponseData> get(String path, {Map<String, dynamic>? queryParams, Map<String, dynamic>? headers}) async {
    _options.headers = headers;

    final result = await _dio.get(
      path,
      options: _options,
      queryParameters: queryParams,
    );

    return ResponseData(
      data: result.data,
      statusCode: result.statusCode,
      statusMessage: result.statusMessage,
    );
  }
}
