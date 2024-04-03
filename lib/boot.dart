import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:muse_flutter/core/logger.dart';
import 'package:muse_flutter/data/datasource/remote/gemini_datasource.dart';
import 'package:muse_flutter/injection.dart';

Future<void> boot() async {
  Bloc.observer = XObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await inject();
}

/// in inject call this
Future initGemini() async {
  final env = GetIt.I.get<DotEnv>();
  final apiKey = env.get('GEMINI_API_KEY');
  final GeminiDatasource gemini = GeminiDatasource();
  gemini.ignite(GenerativeModel(model: "gemini-pro", apiKey: apiKey));
  GetIt.I.registerSingleton(gemini);
}

class XObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    XLog.red("$stackTrace", name: bloc.runtimeType.toString());
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    XLog.yellow(
        "transition: ${transition.currentState.runtimeType} => ${transition.nextState.runtimeType}",
        name: bloc.runtimeType.toString());
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    XLog.green("event: ${event.runtimeType}",
        name: bloc.runtimeType.toString());
  }
}
