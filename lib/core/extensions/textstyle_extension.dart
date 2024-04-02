import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle? {
  TextStyle? s(double size) => this?.copyWith(fontSize: size);
  TextStyle? get wb => this?.copyWith(fontWeight: FontWeight.bold);
  TextStyle? get wl => this?.copyWith(fontWeight: FontWeight.w300);
  TextStyle? w(FontWeight weight) => this?.copyWith(fontWeight: weight);
  TextStyle? get r => this?.copyWith(decoration: TextDecoration.underline);
  TextStyle? c(Color color) => this?.copyWith(color: color);
  TextStyle? get cw => this?.copyWith(color: Colors.white);
}
