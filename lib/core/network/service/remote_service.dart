abstract class RemoteService {
  Future<dynamic> getResponse({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    bool isTokenRequired = false,
  });

  Future<dynamic> deleteResponse({
    required String endPoint,
    bool isTokenRequired = false,
  });

  Future<dynamic> postResponse({
    required String endPoint,
    Map<String, dynamic>? payloadObj,
    Map<String, dynamic>? queryParameters,
    bool isTokenRequired = false,
  });

  Future<dynamic> putResponse({
    required String endPoint,
    Map<String, dynamic>? payloadObj,
    Map<String, dynamic>? queryParameters,
    bool isTokenRequired = false,
  });

  Future<dynamic> patchResponse({
    required String endPoint,
    Map<String, dynamic>? payloadObj,
    Map<String, dynamic>? queryParameters,
    bool isTokenRequired = false,
  });
}
