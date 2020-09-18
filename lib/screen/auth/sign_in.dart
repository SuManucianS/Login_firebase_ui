import 'package:flutter/material.dart';
import 'package:flutter_loginui/config/Palette.dart';
import 'package:flutter_loginui/screen/auth/decoration_funcion.dart';
import 'package:flutter_loginui/screen/auth/title.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:flutter_loginui/screen/auth/signup_bar.dart';
class SignIn extends StatelessWidget {

  const SignIn({Key key,@required this.onRegisterClicked}) : super (key : key);
  final VoidCallback onRegisterClicked;
  @override
  Widget build(BuildContext context) {
    final isSubmitting = context.isSubmitting();
    return SignInForm(
      child : Padding(
        padding: const EdgeInsets.all(30.0),// padding all view 8.0
        child: Column(

          children: [
            Expanded(
              flex: 3,
              child: Align(alignment: Alignment.centerLeft,
              child: LoginTitle(
                title: 'Welcom/back',
              ),),

            ),
            Expanded(
              flex: 4,
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: EmailTextFormField(
                      decoration: signInInputDecoration(hintText: 'Email')
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: PasswordTextFormField(
                        decoration: signInInputDecoration(hintText: 'Password')
                    ),
                  ),
                  SignInBar(
                    isLoading: isSubmitting,
                    label: 'Sign In',
                    onPressed: (){
                      //print("u r clicked");
                      context.signInWithEmailAndPassword();
                    },
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: (){
                        onRegisterClicked?.call(

                        );
                      },
                      child: const Text('Sign up',
                        style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          color: Palette.darkBlue,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )));
  }
}
