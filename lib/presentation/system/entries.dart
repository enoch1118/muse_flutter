import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muse_flutter/presentation/chat/bloc/overlay_bloc.dart';
import 'package:muse_flutter/presentation/system/router.dart';
import 'package:muse_flutter/presentation/system/setting/disallow_overscroll.dart';

class MuseApp extends StatelessWidget {
  const MuseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OverlayBloc(),
      child: MaterialApp.router(
        builder: (context, child) {
          return Overlay(
            initialEntries: [
              OverlayEntry(
                  builder: (context) => _Unfocus(child: child ?? Container()))
            ],
          );
        },
        scrollBehavior: DisallowOverscrollBehavior(),
        routerConfig: XRouter.router,
      ),
    );
  }
}

class _Unfocus extends StatelessWidget {
  const _Unfocus({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}
