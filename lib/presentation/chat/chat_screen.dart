import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:muse_flutter/core/extensions/extensions.dart';
import 'package:muse_flutter/core/extensions/widget_extension.dart';
import 'package:muse_flutter/presentation/chat/bloc/chat_bloc.dart' as c;
import 'package:muse_flutter/presentation/chat/bloc/overlay_bloc.dart' as o;
import 'package:muse_flutter/presentation/chat/chat_item.dart';
import 'package:muse_flutter/presentation/common/gesture/tap.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key, this.initPrompt, this.chatId});
  final String? initPrompt;
  final int? chatId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = c.ChatBloc();
        if (initPrompt != null) {
          bloc.add(c.OnInit(initPrompt: Content.text(initPrompt!)));
        }
        return bloc;
      },
      child: const _ChatScreen(),
    );
  }
}

class _ChatScreen extends StatefulWidget {
  const _ChatScreen();

  @override
  State<_ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<_ChatScreen> {
  final scroll = ScrollController();
  double prevOffset = 0;
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<o.OverlayBloc, o.OverlayState>(
          listener: (context, state) {
            switch (state) {
              case o.Loading(:final content):
                context.read<c.ChatBloc>().add(c.OnSend(content));
                break;
              default:
            }
          },
        ),
        BlocListener<c.ChatBloc, c.ChatState>(
          listener: (context, state) {
            switch (state) {
              case c.Loaded():
                context.read<o.OverlayBloc>().add(o.OnLoaded());
                break;
              default:
            }
          },
        ),
      ],
      child: Scaffold(
        body: Column(
          children: [
            _buildHeader(context),
            Expanded(child: _buildBody(context))
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<c.ChatBloc, c.ChatState>(
      builder: (context, state) {
        List<Content> con = [];
        bool isLoading = false;
        switch (state) {
          case c.Loading(:final contents):
            con = contents;
            isLoading = true;
            break;
          case c.Loaded(:final contents):
            con = contents;
            break;
          default:
        }
        return NotificationListener(
          onNotification: (ScrollNotification noti) {
            if (noti is! UserScrollNotification) {
              return true;
            }
            if ((scroll.offset - prevOffset).abs() <= 100) {
              return true;
            }
            prevOffset = scroll.offset;
            final bloc = context.read<o.OverlayBloc>();
            switch (bloc.state) {
              case o.AtChatWriting():
                context.read<o.OverlayBloc>().add(o.NoFocus());
                break;
              default:
            }
            return true;
          },
          child: GestureDetector(
            onTap: () {
              final bloc = context.read<o.OverlayBloc>();
              switch (bloc.state) {
                case o.AtChatWriting():
                  context.read<o.OverlayBloc>().add(o.NoFocus());
                  break;
                default:
              }
            },
            child: CustomScrollView(
              controller: scroll,
              slivers: [
                SliverList.builder(
                  itemBuilder: (context, index) => ChatItem(
                    content: con[index],
                    isLoading: index == con.length - 1 && isLoading,
                  ),
                  itemCount: con.length,
                ),
                const SB().h(200).sliver
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return PreferredSize(
            preferredSize: const Size(double.infinity, 120),
            child: Row(
              children: [
                Tap(
                    onPressed: () => context.pop(),
                    child: const Icon(Icons.arrow_back_ios_new))
              ],
            ).bottom)
        .h(110);
  }
}
