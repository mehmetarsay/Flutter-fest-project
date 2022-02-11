import 'package:flutter/material.dart';
import 'package:zam/core/base/base_view_model.dart';
import 'package:zam/core/extension/context_extension.dart';
import 'package:zam/screens/home/home_page_view.dart';
import 'package:zam/screens/map/widget/find_friends.dart';

class SplashViewModel extends CustomBaseViewModel {
  @override
  void initialize(BuildContext context) async {
    this.context = context;
    await Future.delayed(Duration(seconds: 1));

     context.navigateToReplacement( FindFriends());
    // context.navigateToReplacement(GameNewView(gameRoomId: ''));
    // context.navigateToReplacement(LeaderBoardView());
  }
}
