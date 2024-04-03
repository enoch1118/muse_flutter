import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:muse_flutter/core/extensions/widget_extension.dart';
import 'package:muse_flutter/presentation/chat/bloc/chat_bloc.dart' as c;
import 'package:muse_flutter/presentation/chat/bloc/overlay_bloc.dart' as o;
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

class _ChatScreen extends StatelessWidget {
  const _ChatScreen();

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
          listener: (context, state) {},
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
        return CustomScrollView(
          slivers: [
            SliverList.builder(
              itemBuilder: (context, index) => const SB(),
              itemCount: 10,
            ),
          ],
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
