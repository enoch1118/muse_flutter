enum SystemMapper { dotEnvPath, geminiApi }

const _mapper = {
  SystemMapper.dotEnvPath: ".env",
  SystemMapper.geminiApi: "GEMINI_API_KEY"
};

extension MapperExtension on SystemMapper {
  String get path => _mapper[this]!;
}
