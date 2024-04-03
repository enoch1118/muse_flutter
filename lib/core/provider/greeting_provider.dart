import 'package:flutter/material.dart';

class GreetingProvider extends ChangeNotifier {
  String text = "";

  void setText(String text) {
    this.text = text;
  }
}
