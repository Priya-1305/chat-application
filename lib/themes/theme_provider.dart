import 'package:flutter/material.dart';
import 'package:priya/themes/dark_mode.dart';
import 'package:priya/themes/light_dark_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themedata) {
    _themeData = themedata;
    notifyListeners(); // 🔥 This triggers rebuilds
  }

  void toggleThemes() {
    if (_themeData == lightMode) {
      themeData = darkMode;
      print("Switched to Dark Mode");
    } else {
      themeData = lightMode;
      print("Switched to Light Mode");
    }
  }
}
