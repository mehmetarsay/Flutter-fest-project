import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zam/core/extension/context_extension.dart';
import 'package:zam/screens/register/register_view_model.dart';
import 'package:zam/screens/splash/splash_view_model.dart';

import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_form_field.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
        viewModelBuilder: () => RegisterViewModel(),
        onModelReady: (viewModel) => viewModel.initialize(context),
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: const CustomAppBar(
                backgroundColor: Colors.transparent, titleText: 'Kayıt Ol'),
            body: body(viewModel, context),
          );
        });
  }

  Padding body(RegisterViewModel viewModel, BuildContext context) {
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

  Column actionColumn(RegisterViewModel viewModel, BuildContext context) {
    return Column(
      children: [
        CustomButton(text: 'Kayıt Ol', onPressed: () => viewModel.register()),
        TextButton(
            onPressed: () => context.pop(),
            child: const CustomText('Giriş Yap'))
      ],
    );
  }

  Widget inputColumn(RegisterViewModel viewModel) {
    return Form(
      key: viewModel.formKey,
      child: Column(
        children: [
          CustomTextFormField(
              controller: viewModel.email,
              hintText: 'E-mail',
              insideHint: true),
          CustomTextFormField(
              controller: viewModel.name, hintText: 'Ad', insideHint: true),
          CustomTextFormField(
              controller: viewModel.surname,
              hintText: 'Soyad',
              insideHint: true),
          CustomTextFormField(
              controller: viewModel.password,
              hintText: 'Şifre',
              insideHint: true),
          CustomTextFormField(
              controller: viewModel.passwordAgain,
              hintText: 'Şifre Tekrar',
              insideHint: true),
        ],
      ),
    );
  }
}
