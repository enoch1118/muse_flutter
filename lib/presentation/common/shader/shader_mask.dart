import 'package:flutter/material.dart';

class ShaderText extends StatelessWidget {
  const ShaderText(
      {super.key, required this.text, this.style, required this.colors});
  final String text;
  final TextStyle? style;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(colors: colors).createShader(rect);
      },
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
