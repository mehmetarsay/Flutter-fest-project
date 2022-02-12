import 'package:flutter/material.dart';
import 'package:zam/screens/auth/auth_view_model.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key,required this.viewModel}) : super(key: key);
  final AuthViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        child:   Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              colorFilter:   ColorFilter.mode(
                  Colors.black.withOpacity(0.05), BlendMode.dstATop),
              image: AssetImage('assets/images/mountains.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child:   Form(
            key: viewModel.formKeySignup,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(100.0),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.redAccent,
                      size: 50.0,
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child:   Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child:   Text(
                          "E-mail",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Colors.redAccent,
                          width: 0.5,
                          style: BorderStyle.solid),
                    ),
                  ),
                  padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                  child:   Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Material(
                          child: TextField(
                            controller: viewModel.emailController,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'email@mail.com',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Divider(
                  height: 24.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child:   Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child:   Text(
                          "İsim",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Colors.redAccent,
                          width: 0.5,
                          style: BorderStyle.solid),
                    ),
                  ),
                  padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                  child:   Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Material(
                          child: TextField(
                            controller: viewModel.nameController,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'isim',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Divider(
                  height: 24.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child:   Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child:   Text(
                          "Şifre",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Colors.redAccent,
                          width: 0.5,
                          style: BorderStyle.solid),
                    ),
                  ),
                  padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                  child:   Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          obscureText: true,
                          controller: viewModel.passwordController,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '*********',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 24.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child:   Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child:   Text(
                          "Şifre Tekrar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Colors.redAccent,
                          width: 0.5,
                          style: BorderStyle.solid),
                    ),
                  ),
                  padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                  child:   Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          obscureText: true,
                          controller: viewModel.confirmPasswordController,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '*********',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child:   FlatButton(
                        child:   Text(
                          "Hesabınız Var mı?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.end,
                        ),
                        onPressed: () {
                          viewModel.gotoLogin();
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
                  alignment: Alignment.center,
                  child:   Row(
                    children: <Widget>[
                      Expanded(
                        child:   FlatButton(
                          shape:   RoundedRectangleBorder(
                            borderRadius:   BorderRadius.circular(30.0),
                          ),
                          color: Colors.redAccent,
                          onPressed: () {
                            viewModel.signupMethod(context);
                          },
                          child:   Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20.0,
                              horizontal: 20.0,
                            ),
                            child:   Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    "Kayıt Ol",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
