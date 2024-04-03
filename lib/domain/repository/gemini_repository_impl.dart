import 'package:get_it/get_it.dart';
import 'package:google_generative_ai/src/api.dart';
import 'package:google_generative_ai/src/content.dart';
import 'package:muse_flutter/data/datasource/remote/gemini_datasource.dart';
import 'package:muse_flutter/data/repository/gemini_repository.dart';

class GeminiRepositoryImpl implements GeminiRepository {
  final GeminiDatasource gemini = GetIt.I.get();
  @override
  Future<String?> getGreeting() async {
    return gemini.getGreeting();
  }

  @override
  Future<String?> getIntro() {
    return gemini.getIntro();
  }

  @override
  Stream<GenerateContentResponse> chat(List<Content> contents) {
    return gemini.chat(contents);
  }
}
