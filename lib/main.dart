import 'package:flutter/material.dart';
import 'package:flutter_loginui/config/Palette.dart';
import 'package:flutter_loginui/screen/auth/AuthScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
void main () =>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LitAuthInit(
      child: MaterialApp(
        title: 'Login',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.longCangTextTheme(),
          accentColor: Palette.darkOrange,
          appBarTheme: const AppBarTheme(brightness: Brightness.dark,
              color: Palette.darkBlue
          )
        ),
        home: AuthScreen(),
      ),
    );
  }

}