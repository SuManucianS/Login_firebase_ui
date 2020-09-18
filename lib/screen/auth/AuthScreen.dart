import 'package:flutter/material.dart';
import 'package:flutter_loginui/screen/BackgroundPainter.dart';
import 'package:flutter_loginui/screen/auth/register.dart';
import 'package:flutter_loginui/screen/auth/sign_in.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:animations/animations.dart';
class AuthScreen extends StatefulWidget{
  const AuthScreen({Key key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  ValueNotifier<bool> ShowSignInPage = ValueNotifier<bool>(true);
  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2) );
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      body: LitAuth.custom(
        child: Stack(
          children: [
            SizedBox.expand(
              child: CustomPaint(
                painter: BackgroundPainter(
                  animation: _controller.view
                ),
              )
            ),
            Center(
              child: ConstrainedBox(
                constraints:const BoxConstraints(maxWidth: 800),
                child: ValueListenableBuilder<bool>(
                  valueListenable: ShowSignInPage,
                  builder: (context, value, child){
                    return PageTransitionSwitcher(
                      reverse: !value,
                      duration:const Duration(microseconds: 800),
                      transitionBuilder: (child, animation , secondaryanimation){
                        return SharedAxisTransition(
                          animation: animation,
                          secondaryAnimation: secondaryanimation,
                          transitionType: SharedAxisTransitionType.vertical,
                          fillColor: Colors.transparent,
                          child: child,
                        );
                      },
                      child: value ? SignIn(
                      onRegisterClicked: (){
                        context.resetSignInForm();
                        ShowSignInPage.value = false;
                        _controller.forward(); // handle
                      },
                    ) : Register(
                      onSignInPress: (){
                        context.resetSignInForm();
                        ShowSignInPage.value = true;
                        _controller.reverse();
                      },
                    ),
                    );
//                    return
                  }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}