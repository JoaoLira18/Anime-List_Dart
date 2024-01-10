import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier {
  static final ThemeManager _instance = ThemeManager._internal();
  ThemeMode _themeMode = ThemeMode.light;

  get themeMode => _themeMode;

  factory ThemeManager() {
    return _instance;
  }

  ThemeManager._internal() {
    // Constructor
  }

  toggleTheme(isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
