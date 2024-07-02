import 'package:flutter/material.dart';
import 'shared_prefs.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  ThemeProvider() {
    _loadThemePreference();
  }

  bool get isDarkMode => _isDarkMode;

  void toggleTheme(bool isDark) {
    _isDarkMode = isDark;
    SharedPrefs.saveThemePreference(isDark);
    notifyListeners();
  }

  void _loadThemePreference() async {
    _isDarkMode = await SharedPrefs.getThemePreference();
    notifyListeners();
  }
}
