import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instance;

  static ColorSchemeLight? get instance {
    _instance ??= ColorSchemeLight._init();
    return _instance;
  }

  ColorSchemeLight._init();

  final Color blue = const Color(0xff2680ea);
  final Color darkBlue = const Color(0xff0F608E);
  final Color white = const Color(0xffffffff);
  final Color black = const Color(0xff000000);
  final Color grey = Colors.grey;
  final Color red = Colors.redAccent;
}
