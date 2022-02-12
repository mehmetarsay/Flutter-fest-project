import 'package:flutter/material.dart';
import 'package:zam/screens/auth/auth_view_model.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key,required this.viewModel}) : super(key: key);
  final AuthViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            colorFilter:  ColorFilter.mode(
                Colors.black.withOpacity(0.05), BlendMode.dstATop),
            image: AssetImage('assets/images/mountains.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: viewModel.formKeyLogin,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(100.0),
                child: const Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.redAccent,
                    size: 50.0,
                  ),
                ),
              ),
              Row(
                children: const [
                  Expanded(
                    child:  Padding(
                      padding: EdgeInsets.only(left: 40.0),
                      child:  Text(
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
                child:  Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:  <Widget>[
                    Expanded(
                      child: TextField(
                        textAlign: TextAlign.left,
                        controller: viewModel.emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'email@mail.com',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 24.0,
              ),
              Row(
                children: const <Widget>[
                  Expanded(
                    child:  Padding(
                      padding: EdgeInsets.only(left: 40.0),
                      child:  Text(
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
                child:  Row(
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child:  FlatButton(
                      child:  Text(
                        "Şifre mi Unuttum?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                          fontSize: 15.0,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      onPressed: () => {},
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
                alignment: Alignment.center,
                child:  Row(
                  children: <Widget>[
                    Expanded(
                      child:  FlatButton(
                        shape:  RoundedRectangleBorder(
                          borderRadius:  BorderRadius.circular(30.0),
                        ),
                        color: Colors.redAccent,
                        onPressed: ()  {
                          viewModel.loginMethod(context);
                        },
                        child:  Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 20.0,
                          ),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Expanded(
                                child: Text(
                                  "Giriş",
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
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
                alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child:   Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(border: Border.all(width: 0.25)),
                      ),
                    ),
                    Text(
                      "Sosyal",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child:   Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(border: Border.all(width: 0.25)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                child:   Row(
                  children: <Widget>[
                    Expanded(
                      child:   Container(
                        margin: EdgeInsets.only(right: 8.0),
                        alignment: Alignment.center,
                        child:   Row(
                          children: <Widget>[
                            Expanded(
                              child:   FlatButton(
                                shape:   RoundedRectangleBorder(
                                  borderRadius:   BorderRadius.circular(30.0),
                                ),
                                color: Color(0Xff3B5998),
                                onPressed: () => {},
                                child:   Container(
                                  child:   Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                        child:   FlatButton(
                                          onPressed: ()=>{},
                                          padding: EdgeInsets.only(
                                            top: 20.0,
                                            bottom: 20.0,
                                          ),
                                          child:   Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Icon(
                                                const IconData(0xea90,
                                                    fontFamily: 'icomoon'),
                                                color: Colors.white,
                                                size: 15.0,
                                              ),
                                              Text(
                                                "FACEBOOK",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
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
                    ),
                    Expanded(
                      child:   Container(
                        margin: EdgeInsets.only(left: 8.0),
                        alignment: Alignment.center,
                        child:   Row(
                          children: <Widget>[
                            Expanded(
                              child:   FlatButton(
                                shape:   RoundedRectangleBorder(
                                  borderRadius:   BorderRadius.circular(30.0),
                                ),
                                color: Color(0Xffdb3236),
                                onPressed: () => {},
                                child:   Container(
                                  child:   Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                        child:   FlatButton(
                                          onPressed: ()=>{},
                                          padding: EdgeInsets.only(
                                            top: 20.0,
                                            bottom: 20.0,
                                          ),
                                          child:   Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Icon(
                                                const IconData(0xea88,
                                                    fontFamily: 'icomoon'),
                                                color: Colors.white,
                                                size: 15.0,
                                              ),
                                              Text(
                                                "GOOGLE",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
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
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
