import 'package:injectable/injectable.dart';
import 'package:medhavi_app/core/utils/env_helper.dart';

@injectable
class DioConfigs {
  final String baseUrl = EnvHelper.get('API_BASE_URL');
  final int receiveTimeout = 10000;
  final int connectionTimeout = 10000;
}
