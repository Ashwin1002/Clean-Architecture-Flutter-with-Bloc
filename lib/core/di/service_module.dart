import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:medhavi_app/core/utils/env_helper.dart';

@module
abstract class ServiceModule {
  @lazySingleton
  Dio get dio => Dio();

  @lazySingleton
  ImagePicker get imagePicker => ImagePicker();

  @lazySingleton
  GoogleSignIn get googleSignIn => GoogleSignIn(
        scopes: _scopes,
        clientId: clientId,
        serverClientId: clientId,
        // forceCodeForRefreshToken: true,
      );

  @Singleton()
  FlutterSecureStorage get secureStorage => FlutterSecureStorage(
        aOptions: _getAndroidOptions(),
        iOptions: _getIOSOptions(),
      );

  @Singleton()
  InternetConnectionChecker get connectivity => InternetConnectionChecker();
}

// If an app only needs an idToken, or only requests permissions to any/all of the three scopes mentioned above (Op/enID Connect scopes), it won't need to implement any additional scope handling.
const List<String> _scopes = <String>['email', 'profile', 'openid'];

AndroidOptions _getAndroidOptions() =>
    const AndroidOptions(encryptedSharedPreferences: true);

IOSOptions _getIOSOptions() =>
    const IOSOptions(accessibility: KeychainAccessibility.first_unlock);

String? clientId = EnvHelper.get('GOOGLE_CLIENT_ID');
