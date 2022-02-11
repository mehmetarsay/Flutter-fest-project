import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instance;

  static ColorSchemeLight? get instance {
    _instance ??= ColorSchemeLight._init();
    return _instance;
  }

  ColorSchemeLight._init();

  final Color lightGrayishBlue =  Color(0xffE2F2FC);
  final Color lightGrayishBlue2 = Color(0xffD6EBF4);
  final Color lightGrayishBlue3 = Color(0xffA1D2F1);
  final Color lightGrayishBlue4 = Color(0xff9FD1F1);
  final Color lightBlue0 = Color(0xff05D2FF);
  final Color lightBlue1 = Color(0xff05B4FF);
  final Color lightBlue2 = Color(0xff118BBF);
  final Color strongGreen = Color(0xff94C11F);

  final Color blue = Color(0xff1D91D2);
  final Color darkBlue = Color(0xff0F608E);
  final Color white = Color(0xffffffff);

}
