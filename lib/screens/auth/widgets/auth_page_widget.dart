import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zam/screens/auth/auth_view_model.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key,required this.viewModel}) : super(key: key);
  final AuthViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return  Material(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          image: DecorationImage(
            colorFilter:  ColorFilter.mode(
                Colors.black.withOpacity(0.1), BlendMode.dstATop),
            image: AssetImage('assets/images/mountains.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child:  Column(
          children: <Widget>[
            Container(
              height: 200,
              width: 200,
              padding: EdgeInsets.only(top: 100),
              child: Center(child: Lottie.asset('assets/lottie/app_icon.json'),)
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    "Uygulama Adı",
                    style: TextStyle(
                      color: Color(0xff2680EA),
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 150.0),
              alignment: Alignment.center,
              child:   Row(
                children: <Widget>[
                  Expanded(
                    child:  FlatButton(
                      shape:  RoundedRectangleBorder(
                          borderRadius:  BorderRadius.circular(30.0)),
                      color: Colors.white,

                      onPressed: () => viewModel.gotoSignup(),
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
                                "Kayıt Ol",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.redAccent,
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
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
              alignment: Alignment.center,
              child:  Row(
                children: <Widget>[
                  Expanded(
                    child:  FlatButton(
                      shape:  RoundedRectangleBorder(
                          borderRadius:  BorderRadius.circular(30.0)),
                      color: Colors.white,
                      onPressed: () => viewModel.gotoLogin(),
                      child:  Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 20.0,
                        ),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "Giriş",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.redAccent,
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
    );
  }
}
