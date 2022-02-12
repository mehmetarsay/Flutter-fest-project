import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zam/widgets/custom_text_form_field.dart';

import 'login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        // onModelReady: (viewModel) => viewModel.initialize(widget.menuContext),
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextFormField(controller:viewModel.email, hintText: 'E-mail', insideHint: true,),
                  CustomTextFormField(controller:viewModel.password, hintText: 'Şifre', insideHint: true,),
                ],
              ),
            ),
          );
        });
  }
}
