import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget get infW => SizedBox(
        width: double.infinity,
        child: this,
      );
  Widget get infH => SizedBox(
        height: double.infinity,
        child: this,
      );

  Widget h(double height) => SizedBox(
        height: height,
        child: this,
      );

  Widget w(double width) => SizedBox(
        width: width,
        child: this,
      );

  Widget get center => Center(
        child: this,
      );
}

class T extends StatelessWidget {
  const T(this.text, this.style, {super.key});
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}

class CR extends StatelessWidget {
  const CR(this.children, {super.key});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
}

class XFlex extends StatelessWidget {
  const XFlex(this.flex, {super.key});
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Spacer(
      flex: flex,
    );
  }
}

class Sb extends StatelessWidget {
  const Sb({super.key, this.width, this.height, this.child});
  final double? width;
  final double? height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 0,
      height: height ?? 0,
      child: child,
    );
  }
}
