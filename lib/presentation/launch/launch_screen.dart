import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:muse_flutter/core/asset/color_mapper.dart';
import 'package:muse_flutter/core/asset/image_mapper.dart';
import 'package:muse_flutter/core/asset/router_mapper.dart';
import 'package:muse_flutter/core/extensions/router_extension.dart';
import 'package:muse_flutter/presentation/common/shader/shader_mask.dart';
import 'package:muse_flutter/presentation/launch/bloc/launch_bloc.dart';

import '../../core/extensions/extensions.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LaunchBloc()..add(OnLaunch()),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LaunchBloc, LaunchState>(
      listener: (context, state) {
        switch (state) {
          case NeedHome():
            context.xgo(RouterMapper.home);
            break;
          case NeedOnBoarding():
            context.xgo(RouterMapper.onboard);
            break;
          default:
        }
      },
      child: content(context),
    );
  }

  Widget content(BuildContext context) => Scaffold(
        body: Column(
          children: [
            const XFlex(1),
            ShaderText(
              text: "Muse",
              colors: GradientMapper.geminiGradient.colors,
              style: context.t.headlineLarge.s(50).cw,
            ).center.infW,
            const XFlex(1),
            T("powered by", context.t.bodyMedium.c(Colors.grey)),
            const Sb().h(12),
            const XSVG(ImageMapper.geminiLogo).h(50),
            const Sb().h(120)
          ],
        ),
      );
}
