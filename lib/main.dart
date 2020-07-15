import 'package:flutter/material.dart';
import 'package:fluttergram/main_page.dart';
import 'package:fluttergram/constants/material_color.dart';
import 'package:fluttergram/screens/signIn.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
// This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: white,
      ),
      home: SignIn(),
    );
  }
}

