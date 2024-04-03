enum RouterMapper { onboard, home, chat }

const _mapper = {
  RouterMapper.onboard: "onboard",
  RouterMapper.home: "home",
  RouterMapper.chat: "chat"
};

extension MapperExtension on RouterMapper {
  String get path => _mapper[this]!;
}
