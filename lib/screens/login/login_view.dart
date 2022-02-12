import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zam/core/extension/context_extension.dart';
import 'package:zam/widgets/custom_app_bar.dart';
import 'package:zam/widgets/custom_button.dart';
import 'package:zam/widgets/custom_text_form_field.dart';

import '../../widgets/custom_text.dart';
import '../register/register_view.dart';
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
            appBar: const CustomAppBar(backgroundColor: Colors.transparent),
            body: body(viewModel, context),
          );
        });
  }

  Padding body(LoginViewModel viewModel, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          inputColumn(viewModel),
          actionColumn(viewModel, context),
        ],
      ),
    );
  }

  Column actionColumn(LoginViewModel viewModel, BuildContext context) {
    return Column(
      children: [
        const CustomButton(text: 'Giriş Yap'),
        TextButton(onPressed: () => context.navigateTo(RegisterView()), child: const CustomText('Kayıt Ol'))
      ],
    );
  }

  Column inputColumn(LoginViewModel viewModel) {
    return Column(
      children: [
        CustomTextFormField(
            controller: viewModel.email, hintText: 'E-mail', insideHint: true),
        CustomTextFormField(
            controller: viewModel.password, hintText: 'Şifre', insideHint: true)
      ],
    );
  }
}
