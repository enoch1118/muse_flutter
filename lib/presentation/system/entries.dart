import 'package:flutter/material.dart';
import 'package:muse_flutter/presentation/system/router.dart';
import 'package:muse_flutter/presentation/system/setting/disallow_overscroll.dart';

class MuseApp extends StatelessWidget {
  const MuseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scrollBehavior: DisallowOverscrollBehavior(),
      routerConfig: XRouter.router,
    );
  }
}
