import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muse_flutter/presentation/launch/launch_screen.dart';

abstract class XRouter {
  static final routerKey = GlobalKey<NavigatorState>();

  static final router =
      GoRouter(navigatorKey: routerKey, initialLocation: "/launch", routes: [
    _launch,
    _onboard,
  ]);

  static final _launch =
      GoRoute(path: "/launch", builder: (_, __) => const LaunchScreen());

  static final _onboard =
      GoRoute(path: "/onboard", builder: (_, __) => const Placeholder());
}
