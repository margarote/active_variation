import 'data/response_data.dart';

abstract class IApiInterceptor {
  Future<ResponseData> get(String path, {Map<String, dynamic>? queryParams, Map<String, dynamic>? headers});
}
