import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zam/core/base/base_view_model.dart';
import 'package:zam/core/extension/context_extension.dart';
import 'package:zam/model/user.dart';
import 'package:zam/services/auth_services.dart';
import 'package:zam/services/firestore_services.dart';

class RegisterViewModel extends CustomBaseViewModel {
  final formKey = GlobalKey<FormState>();
  var email = TextEditingController();
  var name = TextEditingController();
  var surname = TextEditingController();
  var password = TextEditingController();
  var passwordAgain = TextEditingController();

  initialize(BuildContext context){
    this.context = context;
  }

  void register() async {
    if (formKey.currentState!.validate()) {
      if (passwordAgain.text == password.text) {
        var authUser =
            await AuthService.instance!.registerUser(email.text, password.text);
        if (authUser != null) {
          authUser as User;
          var myUser = MyUser(
              id: authUser.uid,
              name: name.text,
              surname: surname.text,
              email: email.text);
          var registerFirestore =
              await FirestoreServiceApp.instance!.registerUser(myUser);
          context.pop();
        }
      } else {}
    } else {}
  }
}
