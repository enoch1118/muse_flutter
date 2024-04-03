import 'package:flutter/cupertino.dart';

class Tap extends StatelessWidget {
  const Tap(
      {super.key,
      required this.child,
      this.onPressed,
      this.ignoreMinsize = false});
  final Widget child;
  final VoidCallback? onPressed;
  final bool ignoreMinsize;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        borderRadius: BorderRadius.circular(0),
        minSize: (ignoreMinsize ? 0 : kMinInteractiveDimensionCupertino),
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: child);
  }
}
