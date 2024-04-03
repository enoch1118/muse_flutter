import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:muse_flutter/core/asset/image_mapper.dart';
import 'package:muse_flutter/core/extensions/extensions.dart';
import 'package:muse_flutter/presentation/chat/util/content_extension.dart';

enum RoleType { user, model }

const _map = {"user": RoleType.user, "model": RoleType.model};

extension RoleExtension on RoleType {
  Alignment get alignment {
    switch (this) {
      case RoleType.user:
        return Alignment.centerLeft;
      case RoleType.model:
        return Alignment.centerLeft;
    }
  }

  Color get backGroundColor {
    switch (this) {
      case RoleType.user:
        return Colors.transparent;
      case RoleType.model:
        return const Color.fromRGBO(235, 235, 238, 1);
    }
  }
}

RoleType _mapToRoleType(String? role) {
  if (role == null) {
    return RoleType.user;
  }
  return _map[role] ?? RoleType.user;
}

class ChatItem extends StatefulWidget {
  const ChatItem({super.key, required this.content, this.isLoading = false});
  final Content content;
  final bool isLoading;

  @override
  State<ChatItem> createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  final key = GlobalKey();
  @override
  void didUpdateWidget(covariant ChatItem oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.isLoading != widget.isLoading) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted && key.currentContext != null) {
          return Scrollable.ensureVisible(key.currentContext!,
              alignment: 0,
              duration: Durations.medium1,
              curve: Curves.fastEaseInToSlowEaseOut);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final role = _mapToRoleType(widget.content.role);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(color: role.backGroundColor),
        child: Align(
            alignment: role.alignment,
            child: Builder(builder: (context) {
              if (role == RoleType.model) {
                return Column(
                  children: [
                    const XSVG(ImageMapper.geminiIcon)
                        .wh(24)
                        .conditional(
                            widget.isLoading,
                            (p0) => p0
                                .animate(onPlay: (_) => _.repeat())
                                .rotate(
                                    duration: const Duration(seconds: 3),
                                    alignment: Alignment.center))
                        .start,
                    const SB().h(8),
                    MarkdownBody(
                      data: widget.content.combineTextParts() ?? "",
                    ).start,

                    /// visible target
                    Container(
                      key: key,
                    ).h(16),
                    if (widget.isLoading)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: const CircularProgressIndicator(
                          color: Colors.purple,
                          strokeWidth: 1,
                        ).wh(16).start,
                      )
                  ],
                );
              }
              return T(widget.content.combineTextParts() ?? "",
                  context.t.bodyMedium);
            })));
  }
}
