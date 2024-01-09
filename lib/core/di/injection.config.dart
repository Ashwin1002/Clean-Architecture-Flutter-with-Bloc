// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i8;
import 'package:image_picker/image_picker.dart' as _i9;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i11;
import 'package:medhavi_app/core/di/service_module.dart' as _i15;
import 'package:medhavi_app/core/network/dio/config/dio_config.dart' as _i6;
import 'package:medhavi_app/core/network/dio/dio_client.dart' as _i5;
import 'package:medhavi_app/core/network/service/remote_service.dart' as _i12;
import 'package:medhavi_app/core/network/service/remote_service_impl.dart'
    as _i13;
import 'package:medhavi_app/core/router/auth_guard.dart' as _i3;
import 'package:medhavi_app/core/utils/image_utils.dart' as _i10;
import 'package:medhavi_app/core/utils/third_party_signin.dart' as _i14;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final serviceModule = _$ServiceModule();
    gh.factory<_i3.AuthGuard>(() => _i3.AuthGuard());
    gh.lazySingleton<_i4.Dio>(() => serviceModule.dio);
    gh.factory<_i5.DioClient>(() => _i5.DioClient());
    gh.factory<_i6.DioConfigs>(() => _i6.DioConfigs());
    gh.singleton<_i7.FlutterSecureStorage>(serviceModule.secureStorage);
    gh.lazySingleton<_i8.GoogleSignIn>(() => serviceModule.googleSignIn);
    gh.lazySingleton<_i9.ImagePicker>(() => serviceModule.imagePicker);
    gh.factory<_i10.ImagePickerUtil>(() => _i10.ImagePickerUtil());
    gh.singleton<_i11.InternetConnectionChecker>(serviceModule.connectivity);
    gh.factory<_i12.RemoteService>(() => _i13.RemoteServiceImpl());
    gh.factory<_i14.ThirdPartySignIn>(() => _i14.ThirdPartySignInImpl());
    return this;
  }
}

class _$ServiceModule extends _i15.ServiceModule {}
