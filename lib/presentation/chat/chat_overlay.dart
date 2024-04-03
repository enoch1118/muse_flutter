import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:muse_flutter/core/asset/router_mapper.dart';
import 'package:muse_flutter/core/extensions/extensions.dart';
import 'package:muse_flutter/core/extensions/router_extension.dart';
import 'package:muse_flutter/core/logger.dart';
import 'package:muse_flutter/presentation/chat/bloc/overlay_bloc.dart' as o;
import 'package:muse_flutter/presentation/common/clip/clips.dart';
import 'package:muse_flutter/presentation/common/gesture/tap.dart';

class ChatOverlay extends StatefulWidget {
  static insertOverlay(context) {
    final overlay = OverlayEntry(builder: (context) => const ChatOverlay());
    Overlay.of(context).insert(overlay);
  }

  const ChatOverlay({super.key});

  @override
  State<ChatOverlay> createState() => _ChatOverlayState();
}

class _ChatOverlayState extends State<ChatOverlay> {
  final controller = TextEditingController();
  final focus = FocusNode();
  final fullfocus = FocusNode();

  @override
  void initState() {
    super.initState();
    focus.addListener(() {
      XLog.yellow("focus: ${focus.hasFocus}");
      if (focus.hasPrimaryFocus) {
        context.read<o.OverlayBloc>().add(o.HasFocus());
        Future.delayed(Durations.long1, () {
          if (mounted) {
            fullfocus.requestFocus();
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<o.OverlayBloc, o.OverlayState>(
      listener: (context, state) {
        switch (state) {
          case o.AtHome():
            if (mounted) {
              controller.clear();
              if (fullfocus.hasFocus) {
                fullfocus.unfocus();
              }
            }
            break;
          default:
        }
      },
      child: BlocBuilder<o.OverlayBloc, o.OverlayState>(
        builder: (context, state) {
          Widget editor = Container();
          Radius radius = const Radius.circular(20);
          double height = 200;
          switch (state) {
            case o.Init():
            case o.AtHome():
              editor = fullEditor(context);
              break;
            case o.AtChat():
              radius = const Radius.circular(0);
              editor = SmallEditor(
                isLoading: false,
                focus: focus,
                controller: controller,
              );
              height = 120;
              break;
            case o.Loading():
              radius = const Radius.circular(0);
              editor = SmallEditor(
                focus: focus,
                controller: controller,
                isLoading: true,
              );
              height = 120;
              break;
            case o.AtChatWriting():
              radius = const Radius.circular(20);
              editor = fullEditor(context);
              break;
            default:
          }
          return Align(
            alignment: Alignment.bottomCenter,
            child: Material(
              child: AnimatedContainer(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                width: MediaQuery.of(context).size.width,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: radius, topRight: radius),
                    boxShadow: const [
                      BoxShadow(color: Colors.black38, blurRadius: 8),
                      BoxShadow(color: Colors.black26, blurRadius: 16),
                    ]),
                height: height,
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Durations.medium1,
                child: OverflowBox(maxHeight: 200, child: editor),
              )
                  .animate()
                  .moveY(
                      begin: 50, end: 0, curve: Curves.fastEaseInToSlowEaseOut)
                  .infW,
            ),
          );
        },
      ),
    );
  }

  Column fullEditor(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: 200 - 76,
              child: ClipPath(
                clipper: NoTopClip(),
                child: TextField(
                  focusNode: fullfocus,
                  controller: controller,
                  clipBehavior: Clip.none,
                  maxLines: 3,
                  decoration: InputDecoration(
                      hintStyle: context.t.bodyLarge.c(Colors.grey),
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      hintText: "Enter your question here"),
                ).wpLeftv(20).wpRightv(20).wpBottomv(16).wpTopv(20),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 20,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        stops: const [0.2, 1],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white, Colors.white.withOpacity(0)])),
              ),
            )
          ],
        ),
        const XFlex(1),
        RBTW([
          const XFlex(1),
          Tap(
                  onPressed: () async {
                    handleSubmit();
                  },
                  child: const Icon(Icons.send))
              .animate(delay: Durations.short1)
              .moveY(curve: Curves.fastLinearToSlowEaseIn)
              .fadeIn()
        ]).wpBottomv(20).wpLeftv(20).wpRightv(20)
      ],
    );
  }

  void handleSubmit() async {
    final bloc = context.read<o.OverlayBloc>();
    switch (bloc.state) {
      case o.Init():
      case o.AtHome():
        if (controller.text.isNotEmpty) {
          final future = context
              .xpush(RouterMapper.chat, extra: {"initPrompt": controller.text});
          controller.text = "";
          context.read<o.OverlayBloc>().add(o.ToChat());
          await future;
          if (mounted) {
            context.read<o.OverlayBloc>().add(o.PopToHome());
          }
        }
        break;
      case o.AtChatWriting():
        if (controller.text.isNotEmpty) {
          context
              .read<o.OverlayBloc>()
              .add(o.Sending(Content.text(controller.text)));
          controller.text = "";
        }
        break;
      default:
    }
  }
}

class SmallEditor extends StatelessWidget {
  const SmallEditor({
    super.key,
    required this.focus,
    required this.controller,
    required this.isLoading,
  });

  final bool isLoading;
  final FocusNode focus;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SizedBox(
            height: 44,
            child: TextField(
              focusNode: focus,
              controller: controller,
              maxLines: 1,
              decoration: InputDecoration(
                  hintStyle: context.t.bodyLarge.c(Colors.grey),
                  isDense: true,
                  border: InputBorder.none,
                  hintText: "Enter your question here"),
            ),
          ),
        ),
        Tap(
            child: AnimatedContainer(
          width: isLoading ? 44 : 120,
          height: 44,
          decoration: BoxDecoration(
              color: Colors.purpleAccent,
              borderRadius: BorderRadius.circular(20)),
          duration: Durations.medium1,
          curve: Curves.fastEaseInToSlowEaseOut,
          child: OverflowBox(
            maxWidth: 120,
            child: Builder(builder: (context) {
              if (isLoading) {
                return Center(
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 1,
                  ).wh(16),
                );
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  T("Send", context.t.bodyMedium.c(Colors.white)),
                  const SB().w(16),
                  const Icon(
                    Icons.send,
                    size: 16,
                    color: Colors.white,
                  ),
                ],
              )
                  .animate(delay: Durations.short1)
                  .moveX(curve: Curves.fastLinearToSlowEaseIn)
                  .fadeIn(curve: Curves.fastLinearToSlowEaseIn);
            }),
          ),
        ))
      ],
    )
        .wpLeftv(20)
        .wpRightv(20)
        .wpBottomv(16)
        .wpTopv(20)
        .animate()
        .moveX()
        .fadeIn();
  }
}
