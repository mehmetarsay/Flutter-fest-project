import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zam/core/base/base_view_model.dart';
import 'package:zam/core/extension/context_extension.dart';
import 'package:zam/model/user.dart';
import 'package:zam/screens/data_add/data_add_view.dart';
import 'package:zam/services/auth_services.dart';
import 'package:zam/services/firestore_services.dart';

class AuthViewModel extends CustomBaseViewModel {
  PageController controller =   PageController(initialPage: 1, viewportFraction: 1.0);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();

  final formKeyLogin = GlobalKey<FormState>();
  final formKeySignup = GlobalKey<FormState>();

  gotoLogin() {
    //controller_0To1.forward(from: 0.0);
    controller.animateToPage(
      0,
      duration: Duration(milliseconds: 800),
      curve: Curves.ease,
    );
  }

  gotoSignup() {
    //controller_minus1To0.reverse(from: 0.0);
    controller.animateToPage(
      2,
      duration: Duration(milliseconds: 800),
      curve: Curves.ease,
    );
  }

  loginMethod(BuildContext context)async{
    if (formKeyLogin.currentState!.validate()) {
      var authUser = await AuthService.instance!.login(emailController.text, passwordController.text);
      if (authUser != null) {
        authUser as User;
        var myUser = await FirestoreServiceApp.instance!.loginUser(authUser.uid);
        Fluttertoast.showToast(msg: 'Giriş Başarılı');
        context.navigateToReplacement( DataAddView());
      }

    } else {}
  }
  signupMethod(BuildContext context)async{
    if (formKeySignup.currentState!.validate()) {
    if (confirmPasswordController.text == passwordController.text) {
      var authUser =
          await AuthService.instance!.registerUser(emailController.text, passwordController.text);
      if (authUser != null) {
        authUser as User;
        var myUser = MyUser(
            id: authUser.uid,
            name: nameController.text,
            surname: '',
            email: emailController.text);
        var registerFirestore =
            await FirestoreServiceApp.instance!.registerUser(myUser);
        context.navigateToReplacement( DataAddView());

      }
    } else {
      Fluttertoast.showToast(msg: 'Parolar Eşleşmiyor');

    }
  } else {}

  }
}