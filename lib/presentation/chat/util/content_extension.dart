import 'package:google_generative_ai/google_generative_ai.dart';

extension ContentExtension on Content {
  Content combineParts(String? text) {
    if (text != null) {
      return Content(role, [...parts, TextPart(text)]);
    } else {
      return this;
    }
  }

  String? combineTextParts() {
    if (parts.isEmpty) {
      return null;
    }
    return parts.whereType<TextPart>().map((e) => (e).text).join();
  }
}

Content newAssistantContent() {
  return Content("model", []);
}
