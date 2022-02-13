import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zam/core/base/base_view_model.dart';
import 'package:zam/core/extension/context_extension.dart';
import 'package:zam/screens/auth/auth_view.dart';
import 'package:zam/screens/home/homa_view.dart';

class SplashViewModel extends CustomBaseViewModel {
  void initialize(BuildContext context) async {
    this.context = context;
    await Future.delayed(const Duration(seconds: 1));
    if(FirebaseAuth.instance.currentUser!=null){
      context.navigateToReplacement( HomeView());
    }
    else
    context.navigateToReplacement( AuthView());
    // context.navigateToReplacement(GameNewView(gameRoomId: ''));
    // context.navigateToReplacement(LeaderBoardView());
  }
}
