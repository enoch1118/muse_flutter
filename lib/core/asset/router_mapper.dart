enum RouterMapper { onboard, home }

const _mapper = {RouterMapper.onboard: "/onboard", RouterMapper.home: "/home"};

extension MapperExtension on RouterMapper {
  String get path => _mapper[this]!;
}
