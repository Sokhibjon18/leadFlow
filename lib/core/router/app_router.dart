import 'package:auto_route/auto_route.dart';
import 'package:web_funnel/features/phone_screen/pages/phone_skeleton_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: PhoneSkeletonRoute.page, initial: true),
      ];
}
