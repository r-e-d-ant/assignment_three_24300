import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const String _keyDarkMode = 'darkMode';

  static Future<void> saveThemePreference(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyDarkMode, isDark);
  }

  static Future<bool> getThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyDarkMode) ?? false;
  }
}
