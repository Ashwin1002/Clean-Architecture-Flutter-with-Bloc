import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medhavi_app/core/di/injection.dart';
import 'package:medhavi_app/core/router/app_router.dart';
import 'package:medhavi_app/core/router/auth_guard.dart';
import 'package:medhavi_app/core/theme/theme_config.dart';
import 'package:medhavi_app/core/utils/size/device_size.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureInjection();
  runApp(const MyApp());
}

final _appRouter = AppRouter(getIt<AuthGuard>());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Device.setScreenSize(context, constraints);
        return MaterialApp.router(
          title: 'Flutter Clean Architecture',
          theme: ThemeConfigs.lightTheme(),
          darkTheme: ThemeConfigs.darkTheme(),
          themeMode: ThemeMode.system,
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: AutoRouterDelegate(_appRouter),
        );
      },
    );
  }
}
