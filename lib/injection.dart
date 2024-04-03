import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:muse_flutter/boot.dart';
import 'package:muse_flutter/core/provider/greeting_provider.dart';
import 'package:muse_flutter/data/datasource/local/local_datasource.dart';
import 'package:muse_flutter/data/repository/gemini_repository.dart';
import 'package:muse_flutter/data/repository/system_repository.dart';
import 'package:muse_flutter/domain/repository/gemini_repository_impl.dart';
import 'package:muse_flutter/domain/repository/system_repository_impl.dart';
import 'package:muse_flutter/domain/usecase/gemini_usecase.dart';
import 'package:muse_flutter/domain/usecase/system_usecase.dart';

Future<void> inject() async {
  final gi = GetIt.I;
  final env = DotEnv();
  await env.load();

  gi.registerSingleton(env);

  // data
  final local = LocalDataSource();
  await local.ignite();

  // after local init

  gi.registerSingleton(local);
  await initGemini();

  // repo
  gi.registerSingleton<SystemRepository>(SystemRepositoryImpl());
  gi.registerSingleton<GeminiRepository>(GeminiRepositoryImpl());

  // usecase
  gi.registerSingleton(SystemUsecase());
  gi.registerSingleton(GeminiUsecase());

  // provider
  gi.registerSingleton(GreetingProvider());
}
