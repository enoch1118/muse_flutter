import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum ImageMapper { geminiLogo, intro1, intro2, intro3 }

const _mapper = {
  ImageMapper.geminiLogo: "assets/logo/gemini.svg",
  ImageMapper.intro1: "assets/onboard/intro1.jpeg",
  ImageMapper.intro2: "assets/onboard/intro2.jpeg",
  ImageMapper.intro3: "assets/onboard/intro3.jpeg",
};

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

class XImage extends StatelessWidget {
  const XImage(this.mapper, {super.key});
  final ImageMapper mapper;

  @override
  Widget build(BuildContext context) {
    return Image.asset(mapper.path);
  }
}
