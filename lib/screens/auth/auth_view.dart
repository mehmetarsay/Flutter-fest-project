import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zam/core/extension/context_extension.dart';
import 'package:zam/screens/auth/auth_view_model.dart';
import 'package:zam/screens/auth/widgets/auth_page_widget.dart';
import 'package:zam/screens/auth/widgets/login_page_widget.dart';
import 'package:zam/screens/auth/widgets/signup_page_widget.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => AuthViewModel(),
        builder: (context, viewModel, child) {
          return SizedBox(
              height: context.dynamicHeight(1),
              child: PageView(
                controller: viewModel.controller,
                physics: const AlwaysScrollableScrollPhysics(),
                children: <Widget>[
                  LoginPage(viewModel: viewModel),
                  AuthPage(viewModel: viewModel),
                  SignUpPage(viewModel: viewModel)
                ],
                scrollDirection: Axis.horizontal,
              ));
        });
  }
}
