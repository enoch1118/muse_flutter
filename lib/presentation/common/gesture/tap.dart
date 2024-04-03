import 'package:flutter/cupertino.dart';

class Tap extends StatelessWidget {
  const Tap({super.key, required this.child, this.onPressed});
  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: EdgeInsets.zero, onPressed: onPressed, child: child);
  }
}
