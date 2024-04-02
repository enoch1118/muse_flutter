import 'package:flutter/material.dart';
import 'package:muse_flutter/core/asset/color_mapper.dart';
import 'package:muse_flutter/core/asset/image_mapper.dart';
import 'package:muse_flutter/core/asset/router_mapper.dart';
import 'package:muse_flutter/core/extensions/extensions.dart';
import 'package:muse_flutter/core/extensions/router_extension.dart';
import 'package:muse_flutter/presentation/common/gesture/tap.dart';
import 'package:muse_flutter/presentation/common/shader/shader_mask.dart';

const images = [ImageMapper.intro1, ImageMapper.intro2, ImageMapper.intro3];

const titles = [
  "Welcome to Muse",
  "Powered by Gemini",
  "Revolutionizing Customer Experience",
];

const desc = [
  "Experience seamless communication with our cutting-edge chatbot, powered by Google's Gemini LLM. Engage in natural conversations and get instant, personalized responses.",
  "Our chatbot harnesses the power of Google's Gemini LLM, a state-of-the-art language model, to understand and respond to your queries with remarkable accuracy.",
  "Say goodbye to long wait times and impersonal responses. Our chatbot provides a delightful, efficient, and tailored experience for all your needs."
];

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            onPageChanged: (_) {
              setState(() => index = _);
            },
            itemBuilder: (context, index) => intro(context, index),
            itemCount: 3,
          ),
          if (index == 2)
            Positioned(
              bottom: 120,
              left: 0,
              right: 0,
              child: Tap(
                  onPressed: () {
                    context.xgo(RouterMapper.home);
                  },
                  child: ER(
                    [
                      T(
                        "Start",
                        context.t.bodyLarge.wb.c(Colors.purpleAccent),
                      ),
                      const Sb().w(8),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.purpleAccent,
                        size: 16,
                      ).end,
                    ],
                  )),
            ),
          Positioned(
            bottom: 120,
            left: 0,
            height: 44,
            right: 0,
            child: CR(List.generate(
                titles.length,
                (index) => AnimatedContainer(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == this.index
                            ? Colors.purpleAccent
                            : Colors.grey,
                      ),
                      curve: Curves.fastEaseInToSlowEaseOut,
                      duration: Durations.medium2,
                    ).wh(16))).center,
          )
        ],
      ),
    );
  }

  Padding intro(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const XFlex(1),
          XImage(images[index]).wh(300).round,
          const Sb().h(50),
          ShaderText(
              text: titles[index],
              colors: GradientMapper.geminiGradient.colors,
              style: context.t.titleLarge.cw),
          const Sb().h(18),
          TC(desc[index], context.t.bodyMedium),
          const XFlex(1),
        ],
      ),
    );
  }
}
