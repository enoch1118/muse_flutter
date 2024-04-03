import 'package:google_generative_ai/google_generative_ai.dart';

extension ContentExtension on Content {
  Content combineParts(String? text) {
    if (text != null) {
      return Content(text, [...parts, TextPart(text)]);
    } else {
      return this;
    }
  }
}

Content newAssistantContent() {
  return Content("model", []);
}
