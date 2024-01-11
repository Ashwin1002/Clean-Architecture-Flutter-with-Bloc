import 'package:medhavi_app/core/utils/typedef.dart';

abstract class AuthRemoteRepository {
  EitherData<Map<String, dynamic>> loginUser({
    required String email,
    required String password,
  });

  EitherData<Map<String, dynamic>> logoutUser();

  EitherData<Map<String, dynamic>> registerUser({
    required String fullName,
    required String email,
    required String password,
  });

  EitherData<Map<String, dynamic>> forgotPassword({
    required String email,
  });

  EitherData<Map<String, dynamic>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  });

  EitherData<Map<String, dynamic>> refreshToken({
    required String refreshToken,
  });

  EitherData<Map<String, dynamic>> signInWithGoogle({required String token});

  EitherData<Map<String, dynamic>> signInWithApplee({required String token});
}
