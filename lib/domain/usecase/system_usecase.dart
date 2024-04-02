import 'package:get_it/get_it.dart';
import 'package:muse_flutter/data/repository/system_repository.dart';

class SystemUsecase {
  final SystemRepository systemRepository = GetIt.I.get();

  Future<bool> getFirstLaunch() {
    return systemRepository.getFirstLaunch();
  }

  Future<bool> setFirstLaunch({bool value = true}) {
    return systemRepository.setFirstLaunch(value);
  }
}
