import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:zam/core/base/base_view_model.dart';
import 'package:zam/services/firestore_services.dart';

import '../../services/auth_services.dart';

class LoginViewModel extends CustomBaseViewModel {
  final formKey = GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();

  initialize(BuildContext context){
    this.context = context;
  }

  void login() async {
    if (formKey.currentState!.validate()) {
        var authUser = await AuthService.instance!.login(email.text, password.text);
        if (authUser != null) {
          authUser as User;
          var myUser = await FirestoreServiceApp.instance!.loginUser(authUser.uid);
          print('debug');

        }

    } else {}
  }

}