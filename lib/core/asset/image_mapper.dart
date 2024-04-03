import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum ImageMapper {
  geminiLogo,
  geminiIcon,
  intro1,
  intro2,
  intro3,
  connectError
}

const _mapper = {
  ImageMapper.geminiLogo: "assets/logo/gemini.svg",
  ImageMapper.geminiIcon: "assets/logo/gemini_icon.svg",
  ImageMapper.intro1: "assets/onboard/intro1.jpeg",
  ImageMapper.intro2: "assets/onboard/intro2.jpeg",
  ImageMapper.intro3: "assets/onboard/intro3.jpeg",
  ImageMapper.connectError: "assets/images/connect_error.png"
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
  const XImage(this.mapper, {super.key, this.fit});
  final ImageMapper mapper;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      mapper.path,
      fit: fit,
    );
  }
}

class XDecoImage extends StatelessWidget {
  const XDecoImage(this.mapper, {super.key, this.fit, this.filter});
  final ImageMapper mapper;
  final BoxFit? fit;
  final ColorFilter? filter;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(mapper.path), fit: fit, colorFilter: filter)),
    );
  }
}
