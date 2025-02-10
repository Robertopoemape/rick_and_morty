import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'router_micro.gr.dart';

part 'app_routes_micro.dart';

void autoRouterPopUntil(BuildContext context, String nameRouter) {
  context.router.popUntilRouteWithName(nameRouter);
}

void autoRouterPushNamed(BuildContext context, String namePath) {
  context.router.pushNamed(namePath);
}

void autoRouterPush(BuildContext context, PageRouteInfo route) {
  context.router.push(route);
}

void autoRouterReplace(BuildContext context, PageRouteInfo route) {
  context.router.replace(route);
}

void autoRouterPop(BuildContext context) {
  context.router.maybePop(context);
}

Future<void> autoRouterPopWithAwait(BuildContext context) async {
  await context.router.maybePop(context);
}

void goPushAndRemoveUntil(BuildContext context, PageRouteInfo screen) {
  context.router.replaceAll([screen]);
}
