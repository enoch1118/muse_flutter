import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muse_flutter/presentation/home/home_screen.dart';
import 'package:muse_flutter/presentation/launch/launch_screen.dart';
import 'package:muse_flutter/presentation/onboarding/onboarding_screen.dart';

abstract class XRouter {
  static final routerKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
      navigatorKey: routerKey,
      initialLocation: "/launch",
      routes: [_launch, _onboard, _home]);

  static final _launch =
      GoRoute(path: "/launch", builder: (_, __) => const LaunchScreen());

  static final _onboard =
      GoRoute(path: "/onboard", builder: (_, __) => const OnBoardingScreen());

  static final _home = GoRoute(
    path: "/home",
    builder: (_, __) => const HomeScreen(),
  );
}
