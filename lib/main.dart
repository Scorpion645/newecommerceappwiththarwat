// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newecommerce1123/screens/homepage_screen.dart';
import 'package:newecommerce1123/screens/signup_screen.dart';
import 'package:provider/provider.dart';

import 'provider/modelhud.dart';
import 'screens/Login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) {
        return ModelHud();
      },
      child: MyApp()));
}

//replace the void Main function with the current text

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SignupScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        SignupScreen.id: (context) => SignupScreen(),
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}
