import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get themeData => Theme.of(this);

  double dynamicHeight(double value) => MediaQuery.of(this).size.height * value;

  double dhExceptStatusBar(double value) =>
      (dynamicHeight(1) - dynamicStatusBarHeight()) * value;

  double dhExceptStatusBarAppBar(double value) =>
      (dynamicHeight(1) - dynamicStatusBarHeight() - dynamicAppBarHeight(1)) *
      value;

  double dynamicWidth(double value) => MediaQuery.of(this).size.width * value;

  double dynamicStatusBarHeight({double value = 1}) =>
      MediaQuery.of(this).padding.top * value;

  double dynamicAppBarHeight(double value) =>
      AppBar().preferredSize.height * value;

  double dynamicAppBarWidth(double value) =>
      AppBar().preferredSize.width * value;

  Future navigateTo(Widget widget) async =>
      Navigator.push(this, MaterialPageRoute(builder: (context) => widget));

  Future navigateToReplacement(Widget widget) async =>
      Navigator.pushReplacement(this, MaterialPageRoute(builder: (context) => widget));


  Future navigateToRemoveUntil(Widget widget) async =>
      Navigator.pushAndRemoveUntil(this, MaterialPageRoute(builder: (context) => widget),(r) => false);

  // String formatDateToTime(DateTime? dateTime) =>
  //     formatDate(dateTime!, [HH, ':', nn],
  //         locale: TurkishDateLocale());


  void pop<T extends Object?>([T? result]) => Navigator.pop(this, result);
}
