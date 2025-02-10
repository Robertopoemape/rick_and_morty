part of 'router_micro.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class MicroAppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const CustomRouteType(
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: DetailRoute.page),
        AutoRoute(page: LoginRoute.page)
      ];
}
