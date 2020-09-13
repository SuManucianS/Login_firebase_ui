import 'package:flutter/material.dart';
import 'package:flutter_loginui/screen/auth/decoration_funcion.dart';
import 'package:flutter_loginui/screen/auth/title.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:flutter_loginui/screen/auth/signup_bar.dart';
class SignIn extends StatelessWidget {


  const SignIn({Key key}) : super (key : key);
  @override
  Widget build(BuildContext context) {
    SignInBar signbar;

    return SignInForm(
      child : Padding(
        padding: const EdgeInsets.all(30.0),// padding all view 8.0
        child: Column(

          children: [
            Expanded(
              child: Align(alignment: Alignment.centerLeft,
              child: LoginTitle(
                title: 'Welcom/back',
              ),),

            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: EmailTextFormField(
                      decoration: signInInputDecoration()
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: PasswordTextFormField(
                        decoration: signInInputDecoration()
                    ),
                  ),
                  SignInBar(
                    isLoading: true,
                    label: 'Sign In',
                    onPressed: (){
                      print("u r clicked");
                    },
                  )
                ],
              ),
            ),
          ],
        )));
  }
}
