import 'dart:io';

import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiDatasource {
  GenerativeModel? _model;

  GenerativeModel get model => _model!;

  void ignite(GenerativeModel model) {
    _model = model;
  }

  Future<String?> getGreeting() async {
    final prompt =
        "Provide a friendly greeting message to the user based on the current time ${DateTime.now()} in ${Platform.localeName}. The greeting should be short, around 5-10 words, and appropriate for the specified time of day. Vary the language and phrasing randomly each time.";

    final content = [Content.text(prompt)];
    final res = await model.generateContent(content);
    return res.text;
  }

  Future<String?> getIntro() async {
    final prompt =
        "Generate 5 random questions for use llm, with each question limited to 20 words and separated by the @ symbol in ${Platform.localeName} language, dont use any numbers at start of question just give me raw text, and dont whitespace and break line between every question";

    final content = [Content.text(prompt)];
    final res = await model.generateContent(content);
    return res.text;
  }

  Stream<GenerateContentResponse> chat(List<Content> contents) {
    return model.generateContentStream(contents);
  }
}
