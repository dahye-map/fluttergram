import 'package:flutter/material.dart';
import 'package:fluttergram/constants/size.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    void simpleSnackBar(BuildContext context, String text) {
      final snackBar = SnackBar(
        content: Text(text),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    }



    FlatButton _loginFacebook() {
      return FlatButton.icon(
        textColor: Colors.blue,
        onPressed: () {
          simpleSnackBar(context, 'facebook pressed');
        },
        icon: ImageIcon(
          AssetImage('assets/icon/facebook.png'),
        ),
        label: Text('Login with Facebook'),
      );
    }


    InputDecoration getTextFieldDeco(String hint) {
      return InputDecoration(
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[300], width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[300], width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        fillColor: Colors.grey[100],
        filled: true,
      );
    }

    TextFormField _emailForm() {
      return TextFormField(
        controller: _emailController,
        decoration: getTextFieldDeco('Email'),
        validator: (String value) {
          if (value.isEmpty || !value.contains('@')) {
            return '이메일을 잘못입력하셨습니다.';
          }
          return null;
        },
      );
    }

    TextFormField _pwForm() {
      return TextFormField(
        controller: _pwController,
        decoration: getTextFieldDeco('Password'),
        validator: (String value) {
          if (value.isEmpty) {
            return '비밀번호를 잘못입력하셨습니다.';
          }
          return null;
        },
      );
    }

    Text _forgetPw() {
      return Text(
        'Forgetten password?',
        textAlign: TextAlign.end,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.blue[700],
        ),
      );
    }

    FlatButton _confirmBtn() {
      return FlatButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            // 정상
          }
        },
        child: Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        disabledColor: Colors.blue[100],
      );
    }

    Stack _orLine() {
      return Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            height: 1,
            child: Container(
              color: Colors.grey[300],
              height: 3,
            ),
          ),
          Container(
            height: 3,
            width: 50,
            color: Colors.grey[50],
          ),
          Text(
            'OR',
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      );
    }






    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(common_gap),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Spacer(flex: 6),
              Image.asset('assets/insta_text_logo.png'),  // instagram 로고
              Spacer(flex: 1),
              _emailForm(),
              Spacer(flex: 1),
              _pwForm(),
              Spacer(flex: 1),
              _forgetPw(),
              Spacer(flex: 2),
              _confirmBtn(),
              Spacer(flex: 2),
              _orLine(),
              Spacer(flex: 2),
              _loginFacebook(),
              Spacer(flex: 2),
              Spacer(flex: 6),
            ],
          ),
        ),
      ),
    );
  }
}