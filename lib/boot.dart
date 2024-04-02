import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:muse_flutter/injection.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

Future<void> boot() async {
  WidgetsFlutterBinding.ensureInitialized();
  await inject();
}

Future initGemini() async {
  final env = GetIt.I.get<DotEnv>();
  final apiKey = env.get('GEMINI_API_KEY');
  Gemini.init(apiKey: apiKey);
}
