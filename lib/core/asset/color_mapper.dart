import 'package:flutter/material.dart';

enum GradientMapper { geminiGradient }

const _mapper = {
  GradientMapper.geminiGradient: [
    Color.fromRGBO(112, 129, 230, 1),
    Color.fromRGBO(157, 117, 169, 1),
    Color.fromRGBO(185, 115, 114, 1)
  ]
};

extension MapperExtension on GradientMapper {
  List<Color> get colors => _mapper[this]!;
}
