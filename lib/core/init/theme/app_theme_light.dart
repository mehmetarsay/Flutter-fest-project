import 'light/color_scheme_light.dart';
import 'app_theme.dart';
import 'light/light_theme_interface.dart';
import 'package:flutter/material.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;

  static AppThemeLight? get instance {
    _instance ??= AppThemeLight._init();
    return _instance;
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData(
      primaryColor: colorSchemeLight!.blue,
      colorScheme: ColorScheme.light().copyWith(
          primary: colorSchemeLight!.darkBlue,
          primaryVariant: colorSchemeLight!.white));
}
