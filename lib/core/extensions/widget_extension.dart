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

  Widget wh(double value) => SizedBox(
        height: value,
        width: value,
        child: this,
      );

  Widget get center => Center(
        child: this,
      );

  Widget get end => Align(
        alignment: Alignment.centerRight,
        child: this,
      );

  Widget get start => Align(
        alignment: Alignment.centerLeft,
        child: this,
      );

  Widget get round => ClipRRect(
        borderRadius: BorderRadius.circular(20),
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

class TC extends StatelessWidget {
  const TC(this.text, this.style, {super.key});
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: TextAlign.center,
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

class ER extends StatelessWidget {
  const ER(this.children, {super.key});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
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
