import 'dart:async';

import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';
import 'package:medhavi_app/core/di/injection.dart';
import 'package:medhavi_app/core/errors/exceptions.dart';
import 'package:medhavi_app/core/network/dio/config/dio_config.dart';
import 'package:medhavi_app/core/network/dio/dio_client.dart';
import 'package:medhavi_app/core/network/dio/error_handler/dio_error.dart';
import 'package:medhavi_app/core/network/dio/interceptors/auth_interceptor.dart';
import 'package:medhavi_app/core/network/dio/interceptors/retry_interceptor.dart';
import 'package:medhavi_app/core/network/service/remote_service.dart';

@Injectable(as: RemoteService)
class RemoteServiceImpl extends RemoteService {
  ///instance of dio client
  final _client = getIt<DioClient>();

  /// instance of dio Config
  final _config = getIt<DioConfigs>();

  ///get reponse
  @override
  Future getResponse({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    bool isTokenRequired = false,
  }) async {
    try {
      final response = await _client.addInterceptors(
        [
          AuthInterceptor(isTokenRequired: isTokenRequired),
          RetryInterceptor(dio: _client.dio),
        ],
      ).get(
        '${_config.baseUrl}/$endPoint',
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (err) {
      throw ServerException(DioExceptionUtil.handleError(err));
    }
  }

  @override
  Future postResponse({
    required String endPoint,
    Map<String, dynamic>? payloadObj,
    Map<String, dynamic>? queryParameters,
    bool isTokenRequired = false,
  }) async {
    try {
      final response = await _client.addInterceptors(
        [
          AuthInterceptor(isTokenRequired: isTokenRequired),
          RetryInterceptor(dio: _client.dio),
        ],
      ).post(
        '${_config.baseUrl}/$endPoint',
        queryParameters: queryParameters,
        data: payloadObj,
      );

      return response.data;
    } on DioException catch (err) {
      throw ServerException(DioExceptionUtil.handleError(err));
    }
  }

  @override
  Future patchResponse({
    required String endPoint,
    Map<String, dynamic>? payloadObj,
    Map<String, dynamic>? queryParameters,
    bool isTokenRequired = false,
  }) async {
    try {
      final response = await _client.addInterceptors(
        [
          AuthInterceptor(isTokenRequired: isTokenRequired),
          RetryInterceptor(dio: _client.dio),
        ],
      ).patch(
        '${_config.baseUrl}/$endPoint',
        queryParameters: queryParameters,
        data: payloadObj,
      );

      return response.data;
    } on DioException catch (err) {
      throw ServerException(DioExceptionUtil.handleError(err));
    }
  }

  @override
  Future putResponse({
    required String endPoint,
    Map<String, dynamic>? payloadObj,
    Map<String, dynamic>? queryParameters,
    bool isTokenRequired = false,
  }) async {
    try {
      final response = await _client.addInterceptors(
        [
          AuthInterceptor(isTokenRequired: isTokenRequired),
          RetryInterceptor(dio: _client.dio),
        ],
      ).put(
        '${_config.baseUrl}/$endPoint',
        queryParameters: queryParameters,
        data: payloadObj,
      );

      return response.data;
    } on DioException catch (err) {
      throw ServerException(DioExceptionUtil.handleError(err));
    }
  }

  @override
  Future deleteResponse({
    required String endPoint,
    bool isTokenRequired = false,
  }) async {
    try {
      final response = await _client.addInterceptors(
        [
          AuthInterceptor(isTokenRequired: isTokenRequired),
          RetryInterceptor(dio: _client.dio),
        ],
      ).delete(
        '${_config.baseUrl}/$endPoint',
      );
      if (response.statusCode == 204) {
        return;
      }
      return response.data;
    } on DioException catch (err) {
      throw ServerException(DioExceptionUtil.handleError(err));
    }
  }
}
