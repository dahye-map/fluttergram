import 'package:flutter/material.dart';
import 'package:fluttergram/widgets/signInForm.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

Positioned _goToSignUpPageBtn(BuildContext context) {

  return Positioned(
    left: 0,
    right: 0,
    bottom: 0,
    height: 40,
    child: FlatButton(
      shape: Border(
        top: BorderSide(
          color: Colors.grey[300],
        ),
      ),
      onPressed: null,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(style: TextStyle(), children: <TextSpan>[
          TextSpan(
            text: 'Don\'t have an account?',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: Colors.black54,
            ),
          ),
          TextSpan(
            text: '  Sign Up',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue[600],
            ),
          ),
        ]),
      ),
    ),
  );
}

class _SignInState extends State<SignIn> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SignInForm(),
            _goToSignUpPageBtn(context),
          ],
        ),
      ),
    );
  }
}