import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muse_flutter/presentation/chat/chat_screen.dart';
import 'package:muse_flutter/presentation/home/home_screen.dart';
import 'package:muse_flutter/presentation/launch/launch_screen.dart';
import 'package:muse_flutter/presentation/onboarding/onboarding_screen.dart';

abstract class XRouter {
  static final routerKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
      navigatorKey: routerKey,
      initialLocation: "/launch",
      routes: [_launch, _onboard, _home]);

  static final _launch = GoRoute(
      name: "launch",
      path: "/launch",
      builder: (_, __) => const LaunchScreen());

  static final _onboard = GoRoute(
      name: "onboard",
      path: "/onboard",
      builder: (_, __) => const OnBoardingScreen());

  static final _home = GoRoute(
      name: "home",
      path: "/home",
      builder: (_, __) => const HomeScreen(),
      routes: [_chat]);

  static final _chat = GoRoute(
    path: "chat",
    name: "chat",
    builder: (_, state) {
      final extra = state.extra as Map<String, dynamic>?;
      String? initPrompt;
      int? chatId;
      if (extra == null) {
        return const ChatScreen();
      }
      if (extra.containsKey("initPrompt")) {
        initPrompt = extra["initPrompt"];
      }
      if (extra.containsKey("chatId")) {
        chatId = extra["chatId"];
      }
      return ChatScreen(
        initPrompt: initPrompt,
        chatId: chatId,
      );
    },
  );
}
