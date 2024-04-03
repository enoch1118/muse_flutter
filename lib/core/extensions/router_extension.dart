import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muse_flutter/core/asset/router_mapper.dart';

extension RouterExtension on BuildContext {
  void xgo(RouterMapper router, {Object? extra}) =>
      GoRouter.of(this).goNamed(router.path, extra: extra);

  Future xpush(RouterMapper router, {Object? extra}) =>
      GoRouter.of(this).pushNamed(router.path, extra: extra);
}
