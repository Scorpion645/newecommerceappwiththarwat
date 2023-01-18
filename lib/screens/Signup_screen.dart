import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/customButton.dart';
import '../widgets/customrow.dart';
import '../widgets/customtextfield.dart';
import 'Login_screen.dart';

class SignupScreen extends StatelessWidget {
  static String id = 'Singup screen';
  String _email = '', _password = '';
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

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
                  const Padding(
                    padding: EdgeInsets.all(50),
                    child: Image(
                        image: AssetImage('assets/images/icons8-buy-100.png')),
                  ),
                  const Positioned(
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
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              myHint: 'Enter your Name',
              myIcon: Icons.email,
              myKeyboard: TextInputType.emailAddress,
              myObscured: false,
              onClick: (String value) {},
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              myHint: 'Enter your Email',
              myIcon: Icons.lock,
              myKeyboard: TextInputType.visiblePassword,
              myObscured: true,
              onClick: (String value) {
                _email = value;
              },
            ),
            const SizedBox(
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
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              buttonFunction: () {
                if (_globalKey.currentState!.validate()) {
                  print(_email);
                }
              },
              buttonTitle: 'Sign up',
            ),
            SizedBox(
              height: 20,
            ),
            CustomRow(
                firstText: 'Already have an account yet?',
                secondText: 'Log in',
                onPressed: () {
                  Navigator.popAndPushNamed(context, LoginScreen.id);
                }),
          ],
        ),
      ),
    );
  }
}
