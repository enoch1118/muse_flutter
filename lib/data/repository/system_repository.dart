abstract class SystemRepository {
  Future<bool> getFirstLaunch();
  Future<bool> setFirstLaunch(bool value);
}
