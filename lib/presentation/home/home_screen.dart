import 'package:flutter/material.dart';
import 'package:muse_flutter/core/asset/color_mapper.dart';
import 'package:muse_flutter/core/extensions/context_extension.dart';
import 'package:muse_flutter/core/extensions/textstyle_extension.dart';
import 'package:muse_flutter/core/extensions/widget_extension.dart';
import 'package:muse_flutter/presentation/common/shader/shader_mask.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HomeScreen();
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Sb().h(120),
            ShaderText(
              text: "Hello,\nWhat can i do for you",
              colors: GradientMapper.geminiGradient.colors,
              style: context.t.titleLarge.s(50).cw,
            ),
          ],
        ),
      ),
    );
  }
}
