import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:medhavi_app/core/di/injection.dart';
import 'package:medhavi_app/core/router/app_router.dart';
import 'package:medhavi_app/core/router/auth_guard.dart';
import 'package:medhavi_app/core/theme/theme_config.dart';
import 'package:medhavi_app/core/theme/theme_cubit.dart';
import 'package:medhavi_app/core/utils/size/device_size.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await configureInjection();

  final Directory tmpDir = await getTemporaryDirectory();

  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: tmpDir);

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const <Locale>[
        // Locale('en'),
        Locale('ne'),
      ],
      fallbackLocale: const Locale('ne'),
      useFallbackTranslations: true,
      child: const MyApp(),
    ),
  );
}

final _appRouter = AppRouter(getIt<AuthGuard>());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        /// setting device screen size for responsiveness
        Device.setScreenSize(context, constraints);
        return BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
          child: BlocBuilder<ThemeCubit, ThemeModeState>(
            builder: (context, state) {
              return MaterialApp.router(
                /// app title
                title: 'Flutter Clean Architecture',
                debugShowCheckedModeBanner: false,

                /// theme config
                theme: ThemeConfigs.lightTheme(),
                darkTheme: ThemeConfigs.darkTheme(),
                themeMode: state.themeMode,

                /// routing config
                routeInformationParser: _appRouter.defaultRouteParser(),
                routerDelegate: AutoRouterDelegate(_appRouter),

                //localization config
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
              );
            },
          ),
        );
      },
    );
  }
}
