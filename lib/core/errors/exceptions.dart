abstract class AppException implements Exception {
  final String message;

  AppException(this.message);
}

//date
class ServerException extends AppException {
  ServerException(String message) : super(message);
}

class CacheException extends AppException {
  CacheException(String message) : super(message);
}

//route
class RouteException extends AppException {
  RouteException(String message) : super(message);
}
