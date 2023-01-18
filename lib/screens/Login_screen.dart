// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:newecommerce1123/screens/Signup_screen.dart';

import '../constants/constants.dart';
import '../widgets/customButton.dart';
import '../widgets/customrow.dart';
import '../widgets/customtextfield.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'HomePage';
  String _email = '', _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          // ignore: prefer_const_constructors
          SizedBox(
            height: 30,
          ),
          Stack(
              alignment: Alignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: Image(
                      image: AssetImage('assets/images/icons8-buy-100.png')),
                ),
                Positioned(
                  bottom: 0,
                  child: Text('Buy it',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black,
                        fontFamily: 'pacifico',
                      )),
                )
              ]),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            myHint: 'Enter your Email',
            myIcon: Icons.email,
            myKeyboard: TextInputType.emailAddress,
            myObscured: false,
            onClick: (String value) {
              _email = value;
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            myHint: 'Enter your Password',
            myIcon: Icons.lock,
            myKeyboard: TextInputType.visiblePassword,
            myObscured: true,
            onClick: (String value) {
              _password = value;
            },
          ),
          SizedBox(
            height: 99,
          ),

          CustomButton(
            buttonFunction: () {},
            buttonTitle: 'Log in',
          ),
          SizedBox(
            height: 20,
          ),
          CustomRow(
              firstText: 'Do not have an account yet?',
              secondText: 'Sign up',
              onPressed: () {
                Navigator.popAndPushNamed(context, SignupScreen.id);
              }),
        ],
      ),
    );
  }
}
