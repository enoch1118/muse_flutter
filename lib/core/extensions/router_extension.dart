import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muse_flutter/core/asset/router_mapper.dart';

extension RouterExtension on BuildContext {
  void xgo(RouterMapper router) => GoRouter.of(this).go(router.path);
}
