import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:muse_flutter/core/asset/color_mapper.dart';
import 'package:muse_flutter/core/asset/router_mapper.dart';
import 'package:muse_flutter/core/extensions/context_extension.dart';
import 'package:muse_flutter/core/extensions/router_extension.dart';
import 'package:muse_flutter/core/extensions/textstyle_extension.dart';
import 'package:muse_flutter/core/extensions/widget_extension.dart';
import 'package:muse_flutter/core/provider/greeting_provider.dart';
import 'package:muse_flutter/presentation/chat/bloc/overlay_bloc.dart' as o;
import 'package:muse_flutter/presentation/common/gesture/tap.dart';
import 'package:muse_flutter/presentation/common/shader/shader_mask.dart';
import 'package:muse_flutter/presentation/home/bloc/home_bloc.dart';
import 'package:muse_flutter/presentation/chat/chat_overlay.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(OnInit()),
      child: const _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatefulWidget {
  const _HomeScreen();

  @override
  State<_HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<_HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final greeting = GetIt.I.get<GreetingProvider>();
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        switch (state) {
          case ReadyToAsk():
            ChatOverlay.insertOverlay(context);
            break;
          default:
        }
      },
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SB().h(120),
            ShaderText(
              maxLines: 2,
              text: greeting.text,
              colors: GradientMapper.geminiGradient.colors,
              style: context.t.titleLarge.s(46).cw,
            ).wp,
            questionsBuilder(context),
            // T("기록", context.t.bodyLarge).wp
          ],
        ),
      ),
    );
  }

  Widget questionsBuilder(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        Widget child;
        bool render = false;
        switch (state) {
          case ReadyToAsk(:final vm):
            child = OverflowBox(maxHeight: 120, child: questions(vm.questions));
            render = true;
          default:
            child = const SB();
        }
        return AnimatedContainer(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(),
            height: render ? 120 : 0,
            curve: Curves.fastLinearToSlowEaseIn,
            duration: const Duration(milliseconds: 300),
            child: child);
      },
    );
  }

  Widget questions(List<String> questions) {
    return PageView.builder(
      padEnds: false,
      controller: PageController(viewportFraction: 0.36),
      itemBuilder: (context, index) => LayoutBuilder(builder: (context, cons) {
        return Tap(
          ignoreMinsize: true,
          onPressed: () {
            handleToChat(questions[index], context);
          },
          child: Container(
              width: cons.maxHeight,
              height: cons.maxHeight,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(247, 246, 248, 1),
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(16),
              child:
                  T(questions[index], context.t.bodyMedium.c(Colors.black87))),
        )
            .conditional(index == 0, (_) => _.wpLeft)
            .conditional(index == questions.length - 1, (p0) => p0.wpRight)
            .animate()
            .fadeIn(
                delay: Duration(milliseconds: 20 * index),
                duration: Durations.short3,
                curve: Curves.fastLinearToSlowEaseIn);
      }),
      itemCount: questions.length,
    );
  }

  Future handleToChat(String text, BuildContext context) async {
    final future =
        context.xpush(RouterMapper.chat, extra: {"initPrompt": text});
    context.read<o.OverlayBloc>().add(o.ToChat());
    await future;
    if (mounted) {
      // ignore: use_build_context_synchronously
      context.read<o.OverlayBloc>().add(o.PopToHome());
    }
  }
}
