import 'package:flutter/material.dart';

typedef XWidgetBuilder = Widget Function(Widget);
typedef XWidgetContextBuilder = Widget Function(BuildContext);

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

  Widget get top => Align(
        alignment: Alignment.topCenter,
        child: this,
      );

  Widget get bottom => Align(
        alignment: Alignment.bottomCenter,
        child: this,
      );

  Widget get round => ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: this,
      );

  Widget get wp => Padding(
        padding: const EdgeInsets.all(16),
        child: this,
      );

  Widget wpv(double value) => Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );

  Widget get wpLeft => Padding(
        padding: const EdgeInsets.only(left: 16),
        child: this,
      );

  Widget get wpTop => Padding(
        padding: const EdgeInsets.only(top: 16),
        child: this,
      );

  Widget get wpBottom => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: this,
      );

  Widget get wpRight => Padding(
        padding: const EdgeInsets.only(right: 16),
        child: this,
      );

  Widget wpLeftv(double value) => Padding(
        padding: EdgeInsets.only(left: value),
        child: this,
      );

  Widget wpTopv(double value) => Padding(
        padding: EdgeInsets.only(top: value),
        child: this,
      );

  Widget wpBottomv(double value) => Padding(
        padding: EdgeInsets.only(bottom: value),
        child: this,
      );

  Widget wpRightv(double value) => Padding(
        padding: EdgeInsets.only(right: value),
        child: this,
      );
  Widget conditional(bool condition, XWidgetBuilder ifTrue) {
    if (condition) {
      return ifTrue(this);
    }
    return this;
  }
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
      overflow: TextOverflow.fade,
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

class RC extends StatelessWidget {
  const RC(this.children, {super.key});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
}

class RE extends StatelessWidget {
  const RE(this.children, {super.key});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: children,
    );
  }
}

class RBTW extends StatelessWidget {
  const RBTW(this.children, {super.key});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

class SB extends StatelessWidget {
  const SB({super.key, this.width, this.height, this.child});
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
