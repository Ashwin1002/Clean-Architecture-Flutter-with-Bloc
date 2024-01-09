import 'package:auto_route/auto_route.dart';
import 'package:medhavi_app/core/router/auth_guard.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  final AuthGuard authGuard;

  AppRouter(this.authGuard);

  @override
  List<AutoRoute> get routes => [
        // AutoRoute(page: LoginRoute.page, initial: true, guards: [authGuard]),
      ];
}
