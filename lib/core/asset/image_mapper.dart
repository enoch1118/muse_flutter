import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum ImageMapper { geminiLogo }

const _mapper = {ImageMapper.geminiLogo: "assets/logo/gemini.svg"};

extension MapperExtension on ImageMapper {
  String get path => _mapper[this]!;
}

class XSVG extends StatelessWidget {
  const XSVG(this.mapper, {super.key});
  final ImageMapper mapper;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(mapper.path);
  }
}
