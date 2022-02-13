import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zam/core/extension/context_extension.dart';
import 'package:zam/screens/auth/auth_view_model.dart';

import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_text.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key, required this.viewModel}) : super(key: key);
  final AuthViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(backgroundColor: Colors.transparent),
      // extendBody: true,
      extendBodyBehindAppBar: true,
      body: body(context),
    );
  }

  Container body(BuildContext context) {
    return Container(
      height: context.dynamicHeight(1),
      decoration: backgroundDecoration(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: [
              headerImage(),
              headerTitle(),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildContainer(context, 'Kayıt Ol', () => viewModel.gotoSignup()),
              buildContainer(context, 'Giriş', () => viewModel.gotoLogin()),
            ],
          ),
          SizedBox()
        ],
      ),
    );
  }

  BoxDecoration backgroundDecoration(BuildContext context) {
    return BoxDecoration(
      color: context.themeData.colorScheme.onSecondary.withOpacity(0.5),
      image: DecorationImage(
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.dstATop),
        image: AssetImage('assets/images/mountains.jpg'),
        fit: BoxFit.cover,
      ),
    );
  }

  Container headerTitle() {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text(
            "Yaşanabilir mi?",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff2680EA),
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }

  Container headerImage() {
    return Container(
        height: 200,
        width: 200,
        padding: EdgeInsets.only(top: 100),
        child: Center(
          child: Lottie.asset('assets/lottie/app_icon.json'),
        ));
  }

  Container buildContainer(
      BuildContext context, String text, void Function()? onPressed) {
    return Container(
      width: context.dynamicHeight(1),
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              color: context.themeData.colorScheme.onSecondary,
              onPressed: onPressed,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: CustomText(
                        text,
                        textAlign: TextAlign.center,
                        color: context.themeData.colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
