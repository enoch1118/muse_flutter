import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  TextTheme get t => Theme.of(this).textTheme;
  

}