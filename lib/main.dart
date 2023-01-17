// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'screens/Login_screen.dart';
import 'screens/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SignupScreen.id,
      routes: {
        LoginScreen.id:(context) => LoginScreen(),
        SignupScreen.id:(context) => SignupScreen(),
      },
    );
  }
}
