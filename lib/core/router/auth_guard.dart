import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    // final isAuthenticated = ;
    // if (isAuthenticated) {
    //   router.root.replace(const HomeRoute());
    // } else {
    //   resolver.next(true);
    // }
    resolver.next(true);
  }
}
