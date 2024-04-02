import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:muse_flutter/data/datasource/local/local_datasource.dart';
import 'package:muse_flutter/data/repository/system_repository.dart';
import 'package:muse_flutter/domain/repository/system_repository_impl.dart';
import 'package:muse_flutter/domain/usecase/system_usecase.dart';

Future<void> inject() async {
  final gi = GetIt.I;
  gi.registerSingleton(DotEnv());

  // data
  final local = LocalDataSource();
  await local.ignite();
  gi.registerSingleton(local);

  // repo
  gi.registerSingleton<SystemRepository>(SystemRepositoryImpl());

  // usecase
  gi.registerSingleton(SystemUsecase());
}
