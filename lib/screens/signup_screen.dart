// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:newecommerce1123/screens/Login_screen.dart';
import 'package:newecommerce1123/services/auth.dart';

import '../constants/constants.dart';
import '../widget/customRow.dart';
import '../widget/customTextButton.dart';
import '../widget/customtextfield.dart';

class SignupScreen extends StatelessWidget {
  static String id = 'signup screen';
   String _email ="", _password="";
// SignupScreen({})
  final _auth = Auth();
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
                myHint: 'Enter your Name',
                myKeyboard: TextInputType.emailAddress,
                myObscuredtext: false,
                myPrefixIcon: Icons.person,
                onClick: (value) {
                  print('name is ' + value);
                }),
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
                  print(_email);
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
                  print(_password);
                }),
            SizedBox(
              height: 20,
            ),
            CustomTextButton(
              myButtonTitle: 'Sign up',
              onClick: () async{
                print('the email is' + _email);
                if (_globalKey.currentState!.validate()) {
                  _globalKey.currentState!.save;
                  final authResult = await _auth.signUp(_email, _password);
                  // do something
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomRow(
              myButtonTitle: 'Log in',
              onClick: () {
                Navigator.popAndPushNamed(context, LoginScreen.id);
              },
              myquestion: 'Already have an account?',
            )
          ],
        ),
      ),
    );
  }

}
