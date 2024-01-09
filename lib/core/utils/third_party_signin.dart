import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:medhavi_app/core/di/injection.dart';

abstract class ThirdPartySignIn {
  Future<String?> getGoogleIdToken();
  Future<void> googleSignOut();
}

@Injectable(as: ThirdPartySignIn)
class ThirdPartySignInImpl extends ThirdPartySignIn {
  final _googleSignIn = getIt<GoogleSignIn>();

  @override
  Future<String?> getGoogleIdToken() async {
    String? token;
    try {
      token = await _getGoogleToken();
    } catch (e) {
      debugPrint('error occurred while google sign in');
    }
    return token;
  }

  @override
  Future<void> googleSignOut() async {
    try {
      await _googleSignIn.signOut();
    } catch (e) {
      if (kDebugMode) {
        log('error occured while google sign out: ${e.toString()}');
      }
    }
    return;
  }

  Future<String?> _getGoogleToken() async {
    try {
      final isSignedIn = await _googleSignIn.isSignedIn();

      final signIn = isSignedIn
          ? await _googleSignIn.signInSilently()
          : await _googleSignIn.signIn();
      final auth = await signIn?.authentication;
      return auth?.idToken;
    } catch (e) {
      log('error occured while google sign in: ${e.toString()}');
    }
    return null;
  }
}
