import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import 'splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
        viewModelBuilder: () => SplashViewModel(),
        onModelReady: (viewModel) => viewModel.initialize(context),
        builder: (context, viewModel, child) {
          return Scaffold(
              backgroundColor: Colors.white,
              body: Center(child: Lottie.asset('assets/lottie/app_icon.json'),));
        });
  }
}
