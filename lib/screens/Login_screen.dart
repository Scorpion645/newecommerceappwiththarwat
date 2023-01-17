// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:newecommerce1123/screens/signup_screen.dart';
import 'package:newecommerce1123/services/auth.dart';

import '../constants/constants.dart';
import '../widget/customRow.dart';
import '../widget/customTextButton.dart';
import '../widget/customtextfield.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'Login screen';
  String _email = '', _password = "";
  LoginScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Form(
        key: _globalKey,
        child: ListView(
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
                myKeyboard: TextInputType.emailAddress,
                myObscuredtext: false,
                myPrefixIcon: Icons.email,
                onClick: (value) {
                  _email = value;
                }),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
                myHint: 'Enter your password',
                myKeyboard: TextInputType.text,
                myObscuredtext: true,
                myPrefixIcon: Icons.lock,
                onClick: (value) {
                  _password = value;
                }),
            SizedBox(
              height: 89,
            ),
            CustomTextButton(
              myButtonTitle: 'Log in',
              onClick: () async {
                if (_globalKey.currentState!.validate()) {
                  final authResult = await Auth().logIn(_email, _password);
                  print(authResult.user.uid);
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomRow(
              myButtonTitle: 'Sign up',
              onClick: () {
                Navigator.popAndPushNamed(context, SignupScreen.id);
              },
              myquestion: 'Do not have an account yet?',
            )
          ],
        ),
      ),
    );
  }
}
