import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferences prefs;

  static Future<void> isReady() async {
    SharedPreferencesService.prefs = await SharedPreferences.getInstance();

    return Future<bool>.value(true);
  }

  static void setString(String key, String value) {
    SharedPreferencesService.prefs.setString(key, value);
  }

  static String getString(String key) {
    return SharedPreferencesService.prefs.getString(key);
  }

  static void setInteger(String key, int value) {
    SharedPreferencesService.prefs.setInt(key, value);
  }

  static int getInteger(String key) {
    return SharedPreferencesService.prefs.getInt(key);
  }

  static void deleteItem(key) async {
    await SharedPreferencesService.prefs.remove(key);
  }
}
