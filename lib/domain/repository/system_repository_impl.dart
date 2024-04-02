import 'package:get_it/get_it.dart';
import 'package:muse_flutter/data/datasource/local/local_datasource.dart';
import 'package:muse_flutter/data/repository/system_repository.dart';

class SystemRepositoryImpl extends SystemRepository {
  final LocalDataSource dataSource = GetIt.I.get();

  @override
  Future<bool> getFirstLaunch() {
    return dataSource.getFirstLaunch();
  }

  @override
  Future<bool> setFirstLaunch(bool value) {
    return dataSource.setFirstLaunch(value);
  }
}
