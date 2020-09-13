import 'package:flutter/material.dart';
import 'package:flutter_loginui/screen/auth/AuthScreen.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
void main () =>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LitAuthInit(
      child: MaterialApp(
        title: 'Login',
        home: AuthScreen(),
      ),
    );
  }

}