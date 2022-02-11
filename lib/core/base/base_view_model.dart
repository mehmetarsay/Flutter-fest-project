import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

abstract class CustomBaseViewModel extends BaseViewModel {
  late BuildContext context;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // void initialize(BuildContext context);
}