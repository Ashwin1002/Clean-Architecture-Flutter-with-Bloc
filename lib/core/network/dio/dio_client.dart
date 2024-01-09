import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';
import 'package:medhavi_app/core/di/injection.dart';
import 'package:medhavi_app/core/network/dio/config/dio_config.dart';

final _dioClient = getIt<Dio>();
final _config = getIt<DioConfigs>();

@injectable
class DioClient {
  final Dio _dio = _dioClient
    ..options.baseUrl = _config.baseUrl
    ..options.connectTimeout = Duration(milliseconds: _config.connectionTimeout)
    ..options.receiveTimeout = Duration(milliseconds: _config.receiveTimeout);

  Dio get dio => _dio;

  Dio addInterceptors(Iterable<Interceptor> interceptors) {
    return _dio..interceptors.addAll(interceptors);
  }
}
