import 'package:zam/core/constant/enum/app_theme_enum.dart';
import '../theme/app_theme_light.dart';
import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance!.theme;
  ThemeData get currentTheme => _currentTheme;

  void changeValue(AppThemes theme) {
    if (theme == AppThemes.LIGHT) {
      _currentTheme = AppThemeLight.instance!.theme;
    } else {
      _currentTheme = ThemeData.dark();
    }
    notifyListeners();
  }
}
