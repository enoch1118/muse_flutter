import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:muse_flutter/boot.dart';
import 'package:muse_flutter/core/logger.dart';
import 'package:muse_flutter/data/datasource/remote/gemini_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('gemini test group', () {
    setUp(() async {
      XLog.green("boot test of gemini", name: "gemini test");
      SharedPreferences.setMockInitialValues({});
      await boot();
    });
    test('gemini get greeting', () async {
      final gemini = GetIt.I.get<GeminiDatasource>();
      final res = await gemini.getGreeting();
      expect(res, isNot(null));
      debugPrint(res ?? "no output");
    });

    test('gemini generate question', () async {
      final gemini = GetIt.I.get<GeminiDatasource>();
      final res = await gemini.getIntro();
      expect(res, isNot(null));
      expect(res, contains("@"));
      debugPrint(res ?? "no output");
    });

    test('gemini testChat', () async {
      final gemini = GetIt.I.get<GeminiDatasource>();
      final res = gemini.chat([Content.text("hello")]);

      await for (var event in res) {
        debugPrint(event.text ?? "no output");
      }
    });
    tearDown(() {
      GetIt.I.reset();
    });
  });
}
