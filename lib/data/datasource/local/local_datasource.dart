import 'package:muse_flutter/data/datasource/local/local_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  final Future<SharedPreferences> pref;
  late final SharedPreferences _prefs;

  LocalDataSource() : pref = SharedPreferences.getInstance();

  Future<void> ignite() async {
    _prefs = await pref;
  }

  Future<bool> getFirstLaunch() async {
    return _prefs.getBool(LocalKeys.firstLaunch.name) ?? true;
  }

  Future<bool> setFirstLaunch(bool value) async {
    return _prefs.setBool(LocalKeys.firstLaunch.name, value);
  }
}
