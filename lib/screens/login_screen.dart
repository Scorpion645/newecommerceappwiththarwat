// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:newecommerceapp/screens/home_page_screen.dart';
import 'package:newecommerceapp/screens/signup_screen.dart';

import '../constants.dart';
import '../services/auth.dart';
import '../widgets/customtextfield.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'LoginScreen';
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  late String _email, password;
  final _auth = Auth();

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
        backgroundColor: kMainColor,
        body: Form(
          key: globalKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Stack(
                    alignment: Alignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Image(image: AssetImage('images/icons/buyicon.png')),
                      Positioned(
                        bottom: 0,
                        child: Text('Buy it',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                fontFamily: 'pacifico')),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              CustomTextField(
                  hint: 'Enter your Email',
                  icon: Icons.email,
                  onClick: (value) {
                    _email = value!;
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              CustomTextField(
                  hint: 'Enter your password',
                  icon: Icons.lock,
                  onClick: (value) {
                    password = value!;
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                  child: TextButton(
                      onPressed: () async {
                        if (globalKey.currentState!.validate()) {
                          globalKey.currentState!.save();
                          final result = await _auth.signin(_email, password);
                          print("the result is " + result.user.uid);
                          Navigator.pushNamed(context, HomePage.id);
                        }
                      },
                      child: Text('Log in',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                              backgroundColor: Colors.black))),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?  ',
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignupScreen.id);
                      },
                      child: Text('Sign up',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)))
                ],
              )
            ],
          ),
        ));
  }
}
