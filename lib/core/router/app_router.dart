import 'package:auto_route/auto_route.dart';
import 'package:lead_flow/core/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true, path: '/splash/:id'),
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: HomeRoute.page),
      ];
}
