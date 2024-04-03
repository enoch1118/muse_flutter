import 'package:google_generative_ai/google_generative_ai.dart';

abstract class GeminiRepository {
  Future<String?> getGreeting();
  Future<String?> getIntro();
  Stream<GenerateContentResponse> chat(List<Content> contents);
}
