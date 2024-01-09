import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:medhavi_app/core/utils/error_parser.dart';

class DioExceptionUtil {
  // general methods:-----------------------------------------------------------
  static String handleError(DioException error) {
    String errorDescription = '';
    switch (error.type) {
      case DioExceptionType.cancel:
        errorDescription = 'Request to API server was cancelled';
        break;
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.unknown:
        errorDescription = 'Connection timeout with API server';
        break;
      case DioExceptionType.receiveTimeout:
        errorDescription = 'Receive timeout in connection with API server';
        break;

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode ?? 0;
        switch (statusCode) {
          case 401:
            errorDescription = parseErrorMapToString(error.response?.data);
            break;
          case 429:
            errorDescription = 'Too Many Request! Please try one at a time.';
            break;
          case 502:
            errorDescription =
                'Server is currently updating. Thank you for your patience.';
            break;
          case 523:
            errorDescription = 'Sever is unreachable, Please try again later';
            break;
          default:
            debugPrint(
                '++++++++++++++++++\nerror while processing response: \n\nstatus code: ${error.response}\n\nresponse: ${error.response?.data}\n\n++++++++++++++++++++');
            errorDescription = parseErrorMapToString(error.response?.data);
            break;
        }
        break;
      case DioExceptionType.sendTimeout:
        errorDescription = 'Send timeout in connection with API server';
        break;
      case DioExceptionType.badCertificate:
        errorDescription = 'Incorrect certificate';
        break;
      default:
        errorDescription = 'Unknown Error Occurred';
        break;
    }
    return errorDescription;
  }
}
