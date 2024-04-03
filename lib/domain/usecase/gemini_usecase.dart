import 'package:get_it/get_it.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:muse_flutter/data/repository/gemini_repository.dart';
import 'package:muse_flutter/presentation/chat/util/content_extension.dart';

class GeminiUsecase {
  final GeminiRepository _geminiRepository = GetIt.I.get();
  Future<String?> getGreeting() {
    return _geminiRepository.getGreeting();
  }

  Future<List<String>> getIntro() async {
    final res = await _geminiRepository.getIntro();
    return res?.split('@').map((e) {
          return e.trim();
        }).toList() ??
        [];
  }

  Stream<String?> chat(List<Content> contents) {
    final con = [...contents];
    Content last = con.removeLast();
    return _geminiRepository.chat([...con, last]).map((event) => event.text);
  }
}
