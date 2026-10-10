import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool isDark = true;


  void changeMode(ThemeMode newMode) {
    themeMode = newMode;
    isDark = newMode == ThemeMode.dark;
    notifyListeners();
  }
}
