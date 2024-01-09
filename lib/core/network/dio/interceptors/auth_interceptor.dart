import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:medhavi_app/core/utils/secure_storage.dart';

class AuthInterceptor extends Interceptor {
  final AsyncValueGetter<String?>? accessToken;
  final bool isTokenRequired;

  AuthInterceptor({
    this.accessToken,
    required this.isTokenRequired,
  });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String token = isTokenRequired
        ? accessToken != null
            ? await accessToken!() ?? ''
            : await SecureStorage.instance.getData(key: 'access_token') ?? ''
        : '';
    if (token.isNotEmpty) {
      options.headers.putIfAbsent('Authorization', () => 'Bearer $token');
    }

    super.onRequest(options, handler);
  }
}
